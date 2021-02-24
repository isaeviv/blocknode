require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  #zdes' propisanny testy dlja validacij ob'ekta (v dannom sluchae usera)


    def setup
      @user = User.new(name: "Testovoe Imja", email: "testovyj@email.ru")
    end

    test "should be valid" do
      assert @user.valid?
    end

    test "imja dolzhno byt' nastojaschim!" do
      @user.name = "     "
      assert_not @user.valid?
    end

    test "email dolzhen byt' nastojaschim!" do
      @user.email = "     "
      assert_not @user.valid?
    end

    test "imja ne dolzhno byt' slishkom dlinnym!" do
      @user.name = "a" * 51
      assert_not @user.valid?
    end

    test "email ne dolzhen byt' slishkom dlinnym!" do
      @user.email = "a" * 242 + "@primer.domena"
      assert_not @user.valid?
    end


    test "email dolzhen sootvetstvovat' shablonu user@testovyj.domen " do

      valid_adresses = %w[testovyj@email.ru USER@foo.com P_RI-VET@aaa.foo.com
      privet.poka@foo.jp ilja+masha@baz.cn]

      valid_adresses.each do |valid_adress|
          @user.email = valid_adress
          assert @user.valid?, "#{valid_adress.inspect} invalid!"
      end
    end

    test "email validation should reject invalid addresses" do
        invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                               foo@bar_baz.com foo@bar+baz.com]
        invalid_addresses.each do |invalid_address|
          @user.email = invalid_address
          assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
        end

    end

end
