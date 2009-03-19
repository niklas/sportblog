require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "A New", Post do

  it "should not be valid" do
    @post.should_not be_valid
  end

  it "should have one error on title" do
    @post.should have(1).error_on(:title)
  end

  it "should have one error on body" do
    @post.should have_at_least(1).error_on(:body)
  end
  before(:each) do
    @post = Post.new()
  end
end


describe "A new", Post, "with title and body" do
  before(:each) do
    @post = Post.new(
      :title => 'A Title',
      :body => 'BlaBlaBlaBlaBlaBlaBlaBlaBla'
    )
  end

  it "should be valid" do
    @post.should_not be_valid
  end

  it "should create a post on saving" do
    lambda { @post.save }.should change(Post, :count).by(1)
  end
  it "should create only on post on saving (twice)" do
    lambda { @post.save; @post.save }.should change(Post, :count).by(1)
  end

  describe "After saving it, and search for it" do
    before(:each) do
      @post.save!
      @same_post = Post.find @post.id
    end

    it "should the same" do
      @same_post.should  == @post
    end

    it "should have no comment" do
      pending "we must implement comments first"
      @same_post.should have(:no).comments
    end
  end
end


describe "The Posts form the fixtures" do
  fixtures :posts
  before(:each) do
    @post = posts(:welcome)
  end

  it "should be valid" do
    @post.should be_valid
  end

  it "should find at least 2 posts" do
    Post.should have_at_least(2).records
  end

end
