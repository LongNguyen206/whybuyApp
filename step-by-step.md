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
4. Add step-by-step.md to .gitignore
5. Create a Github repository:
    ```
    git init
    git add .
    git commit -m "message"
    git remote add origin repo-url
    git remote set-url origin git@github.com:LongNguyen206/whybuyApp.git #switches the remote url to allow SSH authorization
    git push -u origin master
    ```
6. Create a "home" controller with a "page" method + a "page.html.erb" file in app/views/home:
    ```
    rails g controller home page
    ```
7. Change root path in config/routes.rb
 
8. Install and configure Bootstrap-Sass:

    https://github.com/twbs/bootstrap-sass
9. Install and configure Simple Form:

    https://github.com/plataformatec/simple_form
10. Install and configure Devise:
    
    https://github.com/plataformatec/devise
11. Create a local "dev" branch (where all the work will happen):
    ```
    git checkout -b dev
    ```
    General solo workflow:
    1. Work on dev branch
    2. Add and commit
    3. Merge with local master
    4. Push to remote master
12. Generate USER Devise model:
    ```
    rails g devise USER
    ```
13. Unlock :omniauthable in app/models/user.rb (and :confirmable later )
14. Uncomment Confirmable section in db/migrate file
15. Add google-omniauth-2 gem:

    https://github.com/zquestz/omniauth-google-oauth2
16. Run `rails db:migrate`
17. Install and configure PureCSS-Sass:

    https://github.com/rubysamurai/purecss-sass
18. Add Pure horizontal menu to created _navbar.html.erb (in views/layouts) and change it accordingly (log in, log out and sign up buttons):

    https://purecss.io/menus/
19. Render navbar in application.html.erb:
    ```
    <%= render 'layouts/navbar' %>
    ```
20. Create scaffold for Profiles:
    ```
    rails g scaffold Profile user:references first_name last_name gender dob:date occupation description:text
    rails db:migrate
    ```
21. Install and configure Devise-uncommon_passwords and Devise_zxcvbn gems:

    https://github.com/HCLarsen/devise-uncommon_password
    https://github.com/bitzesty/devise_zxcvbn
22. Add custom sign_in and sign_out devise routes by uncommenting and changing scoped views to true in config/initializers/devise.rb, and adding relevant routes to routes.rb
23. Add "navbar-btns" class to authentication links in navbar and style them to float to the right
24. Create devise Users controller:
    ```
    rails g devise:controllers users
    ```
25. Copy devise views into views/users (created). All devise views for users are controlled from here
26. Add after_sign_up_path_for method to app/controllers/users/registrations_controller.rb and application_controller.rb
27. Add after_inactive_sign_up_path_for private method to app/controllers/application_controller.rb and application_controller.rb
28. Add profile's destroy dependency to user's model (app/models/user.rb)
29. Disallow user_id parameter in app/controllers/profiles_controller.rb, profile_params method
30. Comment out User association in profile's _form.html.erb, show user email instead of user object in profile's index.html.erb and show.html.erb (app/views/profiles)
31. Link current user's id to profile's user_id in "create" method in app/controllers/profiles_controller.rb
32. Add link to user's profile page in navbar (app/views)
33. Add field validations for first and last names in app/models/profile.rb
