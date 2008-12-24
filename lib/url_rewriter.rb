require 'action_controller/url_rewriter'

module ActionController
  class UrlRewriter
    # Add a secure option to the rewrite method.
    def rewrite_with_secure_option(options = {})
      secure = options.delete(:secure)
      options.merge! :only_path => false, :protocol => secure ? 'https' : 'http'
      rewrite_without_secure_option options
    end
    alias_method_chain :rewrite, :secure_option
  end
end
