!#/usr/bin/env ruby

class Documentation

  def initialize(options)
    @readme_path = options[:readme_path]
    @section = options[:section]
    @end_delimiter = "\n\n## "
    return self
  end

  def generate
    @documentation = "## Documentation\n\n"
    @documentation += comments_from_all_plugin_files
    return self
  end

  def to_s
    @documentation
  end

  def write
    File.write readme_path, new_content
  end

  def comments_from_all_plugin_files
    content = ""
    plugin_files.each do |filename|
      content += "### #{File.basename(filename)}\n\n"

      File.read(filename).split("\n").each do |line|
        if line.strip == "#"
          content += "\n"
        elsif line.strip.start_with? "# ## "
          content += "\n" + line.gsub(/^[ ]*# ## /, '#### ') + "\n"
        elsif line.strip.start_with? "# "
          content += line.gsub(/^[ ]*# /, "") + "\n"
        else
          nil
        end
      end

      content += "\n\n"
    end
    content
  end

  #private

  def readme_path
    File.expand_path @readme_path
  end

  def section_regex
    /#{@section}(.*)#{@end_delimiter}/m
  end

  def current_content
    File.read(readme_path)
  end

  def new_content
    generate if not @documentation
    current_content.gsub section_regex, @documentation + @end_delimiter
  end

  def plugin_path
    File.expand_path("../../../../plugins", __FILE__)
  end

  def plugin_files
    Dir.glob("#{plugin_path}/**/*.zsh").uniq
  end

end

Documentation.new(readme_path: "~/.zsh/README.md", section: '## Documentation').generate.write

