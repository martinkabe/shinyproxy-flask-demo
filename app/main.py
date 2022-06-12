from flask import current_app as app
from flask import Flask, render_template

app = Flask(
    __name__,
    template_folder='./templates',
    static_folder='./static'
)


# index / home page...
@app.route('/') 
def home():
	return render_template("index.html")

# about us page..
@app.route('/about')
def about():
	return render_template("about.html")

# contact us page..
@app.route('/contact')
def contact():
	return render_template("contact.html")


if __name__ == '__main__':
    app.run(
        host='0.0.0.0',
        port=int("8080"),
        debug=True
    ) 