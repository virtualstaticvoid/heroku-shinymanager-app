# Example Shiny Manager App on Heroku

This is an example [Shiny][shiny] application together with [shinymanager][shinymgr],
which uses the [heroku-buildpack-r][buildpack] on Heroku.

> `shinymanager` is a simple and secure authentication mechanism for single [Shiny][shiny] applications.
> Credentials are stored in an encrypted ‘SQLite’ database. Password are hashed using ‘scrypt’ R package.
> Source code of main application is protected until authentication is successful.

## Usage

[![Deploy][button]][deployapp]

You can use this project as a template for creating Shiny applications with shinymanager on Heroku.

Execute these commands to get started:

```bash
# get the sources
git clone https://github.com/virtualstaticvoid/heroku-shinymanager-app.git
cd heroku-shinymanager-app

# optionally, reinitialize git
rm -rf .git
git init -b main
git add --all
git commit -m "initial"

# create a new heroku application, set the buildpack and deploy
heroku create --stack heroku-20 --buildpack vsv/heroku-buildpack-r

# deploy
git push heroku main

# view the application
heroku open
```

Login with one of the following credentials:

| Role  | User Name | Password |
|-------|-----------|----------|
| Admin | `admin`   |`p@ssw0rd`|
| User  | `user`    |`p@ssw0rd`|

## License

MIT License. Copyright (c) 2021 Chris Stefano. See [LICENSE](LICENSE) for details.

<!-- Links -->
[buildpack]: https://github.com/virtualstaticvoid/heroku-buildpack-r
[button]: https://www.herokucdn.com/deploy/button.svg
[deployapp]: https://heroku.com/deploy?template=https://github.com/virtualstaticvoid/heroku-shinymanager-app/tree/main
[shiny]: https://shiny.rstudio.com/
[shinymgr]: https://datastorm-open.github.io/shinymanager/
