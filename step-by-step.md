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
6. Change root path in config/routes.rb
 
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
    General solo workflow:
    1. Work on dev branch
    2. Add and commit
    3. Merge with local master
    4. Push to remote master
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
17. Add Pure horizontal menu to created _navbar.html.erb (in views/layouts) and change it accordingly (log in, log out and sign up buttons):

    https://purecss.io/menus/
18. Render navbar in application.html.erb:
    ```
    <%= render 'layouts/navbar' %>
    ```
19. Create scaffold for Profiles:
    ```
    rails g scaffold Profile user:references first_name last_name gender dob:date occupation description:text
    rails db:migrate
    ```
20. Install and configure Devise-uncommon_passwords and Devise_zxcvbn gems:

    https://github.com/HCLarsen/devise-uncommon_password
    https://github.com/bitzesty/devise_zxcvbn
21. Add custom sign_in and sign_out devise routes by uncommenting and changing scoped views to true in config/initializers/devise.rb, and adding relevant routes to routes.rb
22. Add "navbar-btns" class to authentication links in navbar and style them to float to the right

