if defined?(ChefSpec)
  def install_exabgp(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:exabgp, :install, resource_name)
  end
end
