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
    git push -u origin master
    ```
5. Create a "home" controller with a "page" method + a "page.html.erb" file in app/views/home
    ```
    rails g controller home page
    ```
6. Change root in config/routes.rb:
