exe_cache = []
Dir.foreach('.') do |f|
    if !File.directory?(f) and f.end_with?(".html.erb")
      exe_cache << "html2haml #{f} #{f.rpartition('.')[0]}.haml"
      exe_cache << "haml2slim #{f.rpartition('.')[0]}.haml #{f.rpartition('.')[0]}.slim"
    end
end
exe_cache.each { |c|
    begin
      p1 = fork{exec(c)}
      Process.waitpid p1
    rescue Exception
        put e
    end
}
