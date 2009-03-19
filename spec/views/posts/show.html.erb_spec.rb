require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/posts/show.html.erb" do
  include PostsHelper
  before(:each) do
    assigns[:post] = @post = stub_model(Post,
      :title => "Hello Mum!",
      :body => "I forgot your Birthday, again!"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_tag('p') do
      response.should have_text(/Mum/)
    end
  end
end

