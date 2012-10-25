# Copyright 2012 Mark Rushakoff
# Available under the MIT license, which means you should be able to copy this
# and include it in the asset generation part of your project, which you may not
# be distributing anyhow.  But if your organization does require a different
# license, open an issue on [this project's Github page]() and I'll gladly make
# a release under another license for you.

#require 'rubygems'
require 'sprite_factory'

module Cospmisk
  def self.generate(opts)
    mixins = []
    opts[:image_dirs].each do |image_dir|
      image_dir_name = File.basename(image_dir)
      output_path = "#{opts[:sprite_output_dir]}/#{image_dir_name}.png"
      config = {
        :layout => :horizontal,
        :library => :chunkypng,
        :output_image => output_path,
        :nocss => true
      }

      SpriteFactory.run!(image_dir, config) do |images|
        images.keys.each do |image_name|
          info = images[image_name]
          mixins << <<-MIXIN
@mixin sprite-#{image_dir_name}-#{image_name}() {
  height: #{info[:cssh]};
  width: #{info[:cssw]};
  background-image: url('#{File.basename(output_path)}');
  background-position: #{info[:cssx]} #{info[:cssy]};
}
MIXIN
        end
      end
    end
    
    File.open(opts[:mixin_path], 'w') do |f|
      f.write mixins.join("\n")
    end
  end
end