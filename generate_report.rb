Dir.foreach('features') do |file|
  begin
    if File.extname(file) == ".feature"
       #%x(bundle exec cucumber features/#{file} > /dev/tty 2>&1)
       f = file[0..-9]
      %x(parallel_cucumber -n 6 -o "-f pretty -f html -o features/support/reports/#{f}_report.html" features/#{file}> /dev/tty 2>&1)
      end
  rescue => e
    puts e
  end 
end
