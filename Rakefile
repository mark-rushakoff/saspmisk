task :default => [:generate_sprite_mixins]

task :generate_sprite_mixins do
  require './saspmisk'
  
  Saspmisk::generate({
    :image_dirs => ['images/foo', 'images/bar'],
    :sprite_output_dir => 'images/generated_sprites',
    :mixin_path => 'stylesheets/generated.scss'
  })
end

task :saspmisk_test do
  require 'fileutils'
  FileUtils.rm 'stylesheets/generated.scss', :force => true
  Rake::Task['generate_sprite_mixins'].invoke
  
  unless FileUtils.cmp('stylesheets/generated.scss','stylesheets/expected.scss')
    $stderr.puts `diff -u stylesheets/generated.scss stylesheets/expected.scss`
    raise 'Saspmisk did not generate the correct output'
  end
  
  puts 'Saspmisk works!'
end