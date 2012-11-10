module LayoutHelper

  def title(page_title, show_title = true)
    content_for(:title) { h(page_title.to_s) }
    @show_title = show_title
  end

  def show_title?
    @show_title
  end

  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args) }
  end

  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end

  # Wraps a standard link_to call with an li tag with a possible class of active.
  #
  # Without any additional arguments the current url must match the linked url to be active.
  # e.g. active_link_to('Users', users_path) is only active on users_path.
  #
  # To make multiple pages active pass in an array of urls to the active_paths option.
  # e.g. active_link_to('Users', users_path, active_paths: [users_path, new_user_path, @user, [:edit, @user]])
  #   is active on users_path, new_user_path, user_path(@user) and edit_user_path(@user)
  # or an array of controllers,
  # e.g. active_link_to('Users', users_path, active_controllers: [:leads, :documents])
  def active_link_to(*args, &block)
    if block_given?
      active_link_to(capture(&block), args.first || {}, args.second)
    else
      active = false
      html_options = args.third || {}
      active_paths = html_options.delete(:active_paths)
      active_controllers = html_options.delete(:active_controllers)
      if active_paths.nil? && active_controllers.nil?
        active = true if request.fullpath == args.second
      else
        active_paths.to_a.each do |url_object|
          next if url_object.nil?
          next if url_object.respond_to?(:second) && !url_object.try(:second).try(:persisted?)
          active = request.path == url_for(url_object)
          break if active
        end
        active_controllers.to_a.each do |controller|
          active = params[:controller] == controller.to_s
          break if active
        end
      end
      content_tag :li, active ? { class: 'active' } : nil do
        link_to(*args)
      end
    end
  end

end
