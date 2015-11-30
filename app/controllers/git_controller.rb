require 'digest/sha1'

class GitController < ApplicationController

  COMMIT_TEXT = "This is initial commit"
  FILE_NAME = "hello.txt"
  FILE_CONTENT = "Hello world! It works!"

  def initialize
    init_git_objects
  end

  private

  def init_git_objects
    @object_storage = {}
    @commit_hash = build_commit
  end

  def build_commit
    tree_hash = build_tree
    commit = "tree #{tree_hash}\n\n#{COMMIT_TEXT}"
    commit_content = "commit #{commit.length}\0#{commit}"
    commit_hash = Digest::SHA1.hexdigest(commit_content)
    @object_storage[commit_hash] = pack(commit_content)
    commit_hash
  end

  def build_tree
    file_hash = build_file
    hash_as_bytes = file_hash.scan(/../).map { |x| x.hex.chr }.join
    tree_item = "100644 #{FILE_NAME}\0#{hash_as_bytes}"  # you have multiple items, just concatinate them, no new lines or other separators in between
    tree_content = "tree #{tree_item.length}\0#{tree_item}"
    tree_hash = Digest::SHA1.hexdigest(tree_content)
    @object_storage[tree_hash] = pack(tree_content)
    tree_hash
  end

  def build_file
    blob_content = "blob #{FILE_CONTENT.length}\0#{FILE_CONTENT}"
    blob_hash = Digest::SHA1.hexdigest(blob_content)
    @object_storage[blob_hash] = pack(blob_content)
    blob_hash
  end

  def pack(data)
    return Zlib::Deflate.deflate(data)
  end
end
