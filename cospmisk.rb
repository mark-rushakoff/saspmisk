# Copyright 2012 Mark Rushakoff
# Available under the MIT license, which means you should be able to copy this
# and include it in the asset generation part of your project, which you may not
# be distributing anyhow.  But if your organization does require a different
# license, open an issue on [this project's Github page]() and I'll gladly make
# a release under another license for you.

module Cospmisk
  def self.generate(opts)
    File.open(opts[:mixin_path], 'w') do |f|
      f.write "@import 'foo';"
    end
  end
end