module Libuv
    class Filesystem
        include Assertions, Resource, Listener


        def initialize(loop)
            @loop = loop
        end

        def open(path, flags = 0, mode = 0)
            begin
                @open_deferred = @loop.defer

                assert_type(String, path, "path must be a String")
                assert_type(Integer, flags, "flags must be an Integer")
                assert_type(Integer, mode, "mode must be an Integer")

                check_result! ::Libuv::Ext.fs_open(loop.to_ptr, ::Libuv::Ext.create_request(:uv_fs), path, flags, mode, callback(:on_open))
            rescue Exception => e
                @open_deferred.reject(e)
            ensure
                @open_deferred.promise
            end
        end

        def unlink(path)
            begin
                @unlink_deferred = @loop.defer
                assert_type(String, path, "path must be a String")

                check_result! ::Libuv::Ext.fs_unlink(loop.to_ptr, ::Libuv::Ext.create_request(:uv_fs), path, callback(:on_unlink))
            rescue Exception => e
                @unlink_deferred.reject(e)
            ensure
                @unlink_deferred.promise
            end
        end

        def mkdir(path, mode = 0777)
            begin
                @mkdir_deferred = @loop.defer
                assert_type(String, path, "path must be a String")
                assert_type(Integer, mode, "mode must be an Integer")

                check_result! ::Libuv::Ext.fs_mkdir(loop.to_ptr, ::Libuv::Ext.create_request(:uv_fs), path, mode, callback(:on_mkdir))
            rescue Exception => e
                @mkdir_deferred.reject(e)
            ensure
                @mkdir_deferred.promise
            end
        end

        def rmdir(path)
            begin
                @rmdir_deferred = @loop.defer
                assert_type(String, path, "path must be a String")

                check_result! ::Libuv::Ext.fs_rmdir(loop.to_ptr, ::Libuv::Ext.create_request(:uv_fs), path, callback(:on_rmdir))
            rescue Exception => e
                @rmdir_deferred.reject(e)
            ensure
                @rmdir_deferred.promise
            end
        end

        def readdir(path)
            begin
                @readdir_deferred = @loop.defer
                assert_type(String, path, "path must be a String")

                check_result! ::Libuv::Ext.fs_readdir(loop.to_ptr, ::Libuv::Ext.create_request(:uv_fs), path, 0, callback(:on_readdir))
            rescue Exception => e
                @readdir_deferred.reject(e)
            ensure
                @readdir_deferred.promise
            end
        end

        def stat(path)
            begin
                @stat_deferred = @loop.defer
                assert_type(String, path, "path must be a String")

                check_result! ::Libuv::Ext.fs_stat(loop.to_ptr, ::Libuv::Ext.create_request(:uv_fs), path, callback(:on_stat))
            rescue Exception => e
                @stat_deferred.reject(e)
            ensure
                @stat_deferred.promise
            end
        end

        def rename(old_path, new_path)
            begin
                @rename_deferred = @loop.defer
                assert_type(String, old_path, "old_path must be a String")
                assert_type(String, new_path, "new_path must be a String")

                check_result! ::Libuv::Ext.fs_rename(loop.to_ptr, ::Libuv::Ext.create_request(:uv_fs), old_path, new_path, callback(:on_rename))
            rescue Exception => e
                @rename_deferred.reject(e)
            ensure
                @rename_deferred.promise
            end
        end

        def chmod(path, mode)
            begin
                @chmod_deferred = @loop.defer
                assert_type(String, path, "path must be a String")
                assert_type(Integer, mode, "mode must be an Integer")

                check_result! ::Libuv::Ext.fs_chmod(loop.to_ptr, ::Libuv::Ext.create_request(:uv_fs), path, mode, callback(:on_chmod))
            rescue Exception => e
                @chmod_deferred.reject(e)
            ensure
                @chmod_deferred.promise
            end
        end

        def utime(path, atime, mtime)
            begin
                @utime_deferred = @loop.defer
                assert_type(String, path, "path must be a String")
                assert_type(Integer, atime, "atime must be an Integer")
                assert_type(Integer, mtime, "mtime must be an Integer")

                check_result! ::Libuv::Ext.fs_utime(loop.to_ptr, ::Libuv::Ext.create_request(:uv_fs), path, atime, mtime, callback(:on_utime))
            rescue Exception => e
                @utime_deferred.reject(e)
            ensure
                @utime_deferred.promise
            end
        end

        def lstat(path)
            begin
                @lstat_deferred = @loop.defer
                assert_type(String, path, "path must be a String")

                check_result! ::Libuv::Ext.fs_lstat(loop.to_ptr, ::Libuv::Ext.create_request(:uv_fs), path, callback(:on_lstat))
            rescue Exception => e
                @lstat_deferred.reject(e)
            ensure
                @lstat_deferred.promise
            end
        end

        def link(old_path, new_path)
            begin
                @link_deferred = @loop.defer
                assert_type(String, old_path, "old_path must be a String")
                assert_type(String, new_path, "new_path must be a String")

                check_result! ::Libuv::Ext.fs_link(loop.to_ptr, ::Libuv::Ext.create_request(:uv_fs), old_path, new_path, callback(:on_link))
            rescue Exception => e
                @link_deferred.reject(e)
            ensure
                @link_deferred.promise
            end
        end

        def symlink(old_path, new_path)
            begin
                @symlink_deferred = @loop.defer
                assert_type(String, old_path, "old_path must be a String")
                assert_type(String, new_path, "new_path must be a String")

                check_result! ::Libuv::Ext.fs_symlink(loop.to_ptr, ::Libuv::Ext.create_request(:uv_fs), old_path, new_path, 0, callback(:on_symlink))
            rescue Exception => e
                @symlink_deferred.reject(e)
            ensure
                @symlink_deferred.promise
            end
        end

        def readlink(path)
            begin
                @readlink_deferred = @loop.defer
                assert_type(String, path, "path must be a String")

                check_result! ::Libuv::Ext.fs_readlink(loop.to_ptr, ::Libuv::Ext.create_request(:uv_fs), path, callback(:on_readlink))
            rescue Exception => e
                @readlink_deferred.reject(e)
            ensure
                @readlink_deferred.promise
            end
        end

        def chown(path, uid, gid)
            begin
                @chown_deferred = @loop.defer
                assert_type(String, path, "path must be a String")
                assert_type(Integer, uid, "uid must be an Integer")
                assert_type(Integer, gid, "gid must be an Integer")

                check_result! ::Libuv::Ext.fs_chown(loop.to_ptr, ::Libuv::Ext.create_request(:uv_fs), path, uid, gid, callback(:on_chown))
            rescue Exception => e
                @chown_deferred.reject(e)
            ensure
                @chown_deferred.promise
            end
        end


        private


        def on_open(req)
            # TODO:: Broken!
            #fd   = ::Libuv::Ext.fs_req_result(req)
            #e    = check_result(fd)
            #file = File.new(loop, fd) unless e

            ::Libuv::Ext.fs_req_cleanup(req)
            ::Libuv::Ext.free(req)

            @open_deferred.resolve(nil)
            @open_deferred = nil
        end

        def on_unlink(req)
            ::Libuv::Ext.fs_req_cleanup(req)
            ::Libuv::Ext.free(req)

            @unlink_deferred.resolve(nil)
            @unlink_deferred = nil
        end

        def on_mkdir(req)
            ::Libuv::Ext.fs_req_cleanup(req)
            ::Libuv::Ext.free(req)

            @mkdir_deferred.resolve(nil)
            @mkdir_deferred = nil
        end

        def on_rmdir(req)
            ::Libuv::Ext.fs_req_cleanup(req)
            ::Libuv::Ext.free(req)

            @rmdir_deferred.resolve(nil)
            @rmdir_deferred = nil
        end

        def on_readdir(req)
            # TODO:: Broken
            #string_ptr = ::Libuv::Ext.fs_req_pointer(req)
            #files = string_ptr.null? ? [] : string_ptr.read_string().split("\0")

            ::Libuv::Ext.fs_req_cleanup(req)
            ::Libuv::Ext.free(req)

            @readdir_deferred.resolve(nil)
            @readdir_deferred = nil
        end

        def on_stat(req)
            # TODO:: broken
            #stat = ::Libuv::Ext.fs_req_stat(req)

            ::Libuv::Ext.fs_req_cleanup(req)
            ::Libuv::Ext.free(req)

            @stat_deferred.resolve(nil)
            @stat_deferred = nil
        end

        def on_rename(req)
            ::Libuv::Ext.fs_req_cleanup(req)
            ::Libuv::Ext.free(req)

            @rename_deferred.resolve(nil)
            @rename_deferred = nil
        end

        def on_chmod(req)
            ::Libuv::Ext.fs_req_cleanup(req)
            ::Libuv::Ext.free(req)

            @chmod_deferred.resolve(nil)
            @chmod_deferred = nil
        end

        def on_utime(req)
            ::Libuv::Ext.fs_req_cleanup(req)
            ::Libuv::Ext.free(req)

            @utime_deferred.resolve(nil)
            @utime_deferred = nil
        end

        def on_lstat(req)
            stat = ::Libuv::Ext.fs_req_stat(req)

            ::Libuv::Ext.fs_req_cleanup(req)
            ::Libuv::Ext.free(req)

            @lstat_deferred.resolve(nil)
            @lstat_deferred = nil
        end

        def on_link(req)
            ::Libuv::Ext.fs_req_cleanup(req)
            ::Libuv::Ext.free(req)

            @link_deferred.resolve(nil)
            @link_deferred = nil
        end

        def on_symlink(req)
            ::Libuv::Ext.fs_req_cleanup(req)
            ::Libuv::Ext.free(req)

            @symlink_deferred.resolve(nil)
            @symlink_deferred = nil
        end

        def on_readlink(req)
            # TODO:: broken
            #string_ptr = ::Libuv::Ext.fs_req_pointer(req)
            #path = string_ptr.read_string() unless string_ptr.null?

            ::Libuv::Ext.fs_req_cleanup(req)
            ::Libuv::Ext.free(req)

            @readlink_deferred.resolve(nil)
            @readlink_deferred = nil
        end

        def on_chown(req)
            ::Libuv::Ext.fs_req_cleanup(req)
            ::Libuv::Ext.free(req)

            @chown_deferred.resolve(nil)
            @chown_deferred = nil
        end
    end
end