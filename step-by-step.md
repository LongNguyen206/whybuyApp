1. Setup/Update Ruby, Rails and PostgresQL on your machine:

    https://www.digitalocean.com/community/tutorials/how-to-setup-ruby-on-rails-with-postgres
2. Create a Rails app with PostgresQL database:
    ```
    rails new whybuyApp --database=postgresql --skip-active-storage
    ```
3. Setup the database:
    ```
    rails db:setup
    ```
4. Create a Github repository:
    ```
    git init
    git add .
    git commit -m "message"
    git remote add origin repo-url
    git remote set-url origin git@github.com:LongNguyen206/whybuyApp.git #switches the remote url to allow SSH authorization
    git push -u origin master
    ```
5. Create a "home" controller with a "page" method + a "page.html.erb" file in app/views/home:
    ```
    rails g controller home page
    ```
6. Change root in config/routes.rb:
    ```
    root 'home#page'
    ```
7. Install and configure Bootstrap-Sass:

    https://github.com/twbs/bootstrap-sass
8. Install and configure Simple Form:

    https://github.com/plataformatec/simple_form
9. Install and configure Devise:
    
    https://github.com/plataformatec/devise
10. Create a local "dev" branch (where all the work will happen):
    ```
    git checkout -b dev
    ```
11. Generate USER Devise model:
    ```
    rails g devise USER
    ```
12. Unlock :omniauthable in app/models/user.rb (and :confirmable later )
13. Uncomment Confirmable section in db/migrate file
14. Add google-omniauth-2 gem:

    https://github.com/zquestz/omniauth-google-oauth2
15. Run `rails db:migrate`
16. Install and configure PureCSS-Sass:

    https://github.com/rubysamurai/purecss-sass
17. Add Pure horizontal menu to newly created _navbar.html.erb (in views/layouts) and change it accordingly:

    https://purecss.io/menus/
18. Render navbar in application.html.erb:
    ```
    <%= render 'layouts/navbar' %>
    ```