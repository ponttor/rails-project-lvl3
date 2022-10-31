class AddAdmin < ActiveRecord::Migration[6.1]
  def change
    User.find_by(email: "alex@heimstudio.ru").update(admin: true)
  end
end
