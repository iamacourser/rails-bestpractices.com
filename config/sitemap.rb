# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://rails-bestpractices.com"

SitemapGenerator::Sitemap.add_links do |sitemap|
  sitemap.add root_path, :priority => 0.7, :changefreq => 'daily'
  Post.all.each do |p|
    sitemap.add post_path(p), :lastmod => p.updated_at, :priority => 1.0, :changefreq => 'daily'
  end
end
