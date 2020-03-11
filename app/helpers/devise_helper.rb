module DeviseHelper
  def devise_error_messages!
    return "" if resource.errors.empty?

    html = ""
    messages = resource.errors.full_messages.each do |errmsg|
      html += <<-EOF
      <div class="alert alert-warning alert-dismissible fade show" role="alert">
        <strong>注意!</strong>　このアラートはあなたの注意が必要です。
          <button type="button" class="close" data-dismiss="alert" aria-label="閉じる">
          <span aria-hidden="true">&times;</span>
          </button>
        #{errmsg}
      </div>
      EOF
    end
    html.html_safe
  end

  def devise_error_messages?
    resource.errors.empty? ? false : true
  end

end