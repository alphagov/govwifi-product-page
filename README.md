# GovWifi Product Page

This is the product page for GovWifi. It is a [middleman site](http://middlemanapp.com/) originally copied from the [product-page-example](https://github.com/alphagov/product-page-example) repo.

## Getting Setup for Developement

The recommended ruby version is `2.5.1`. You may need to install this.

To pull the code from Github, enter the following into your terminal (Applications -> Utilities -> Terminal on Mac):

- `git clone https://github.com/alphagov/govwifi-product-page.git`
- `cd govwifi-product-page`
- `gem install bundler`
- `make build`

You can now open the codebase in any text editor and make changes.

## Getting Started

To make the site viewable in your browser:

- `make serve`
- Your browser should open with the site. If it doesn't, open your browser and go to http://localhost:4567

## Contributing

The `source` folder contains all the pages that you will want to change, eg: `index.html.erb`. Whenever you save a change, the site will automatically reload so you can see your changes at `http://localhost:4567`.

Once you have made any changes, do the following to save your changes to git and push to github:

- `git add -A`
- `git commit -m "ADD A SHORT DESCRIPTION OF YOUR CHANGES"`
- `git push`
