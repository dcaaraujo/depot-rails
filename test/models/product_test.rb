require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "title is at least 10 characters" do
    product = new_product("fred.jpg")
    product.title = "abc"
    assert product.invalid?
    assert_equal "is too short (minimum is 10 characters)", product.errors[:title].first
  end

  test "product price must be positive" do
    EXPECTED_ERROR_MESSAGE = "must be greater than or equal to 0.01"

    product = new_product("fred.jpg")
    product.price = -1
    assert product.invalid?
    assert_equal EXPECTED_ERROR_MESSAGE, product.errors[:price].first

    product.price = 0
    assert product.invalid?
    assert_equal EXPECTED_ERROR_MESSAGE, product.errors[:price].first

    product.price = 1
    assert product.valid?
  end

  test "image url" do
    %w{ fred.gif fred.jpg fred.png FRED.JPG http://a.b.c/x/y/z/fred.gif }.each do |image_url|
      assert new_product(image_url).valid?, "#{image_url} must be valid"
    end

    %w{ fred.doc fred.gif.more }.each do |image_url|
      assert new_product(image_url).invalid?, "#{image_url} must be invalid"
    end
  end

  test "product is not valid without a unique title" do
    product = Product.new(
      title: products(:ruby).title,
      description: "My Book Title description",
      price: 1,
      image_url: "fred.gif"
    )
    assert product.invalid?
    assert_equal "has already been taken", product.errors[:title].first
  end

  private

  def new_product(image_url)
    Product.new(
      title: "My Book Title",
      description: "My Book Title description",
      price: 1,
      image_url: image_url
    )
  end
end
