ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :username, :avatar, :admin
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :username, :avatar, :admin]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
index do
  column :email
  column :username
  column :avatar do |avatar|
    truncate(avatar.avatar, omission: "...", length:100)
  end

  column :admin
  column :created_at
  column :friends_count
  column :tweets_count
  column :likes_give_it
  column :retweet_give_it
  actions
end
end
