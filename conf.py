project = 'ASGARD Management Center v3 Manual'
version="3.0"
copyright = '2023, Nextron Systems GmbH'
author = 'Nextron Systems'
extensions = [
    'sphinx.ext.autosectionlabel',
    'sphinx_rtd_theme'
]
templates_path = ['_templates']
source_suffix = '.rst'
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store', '.venv/*']
master_doc = 'index'
language = "en"
html_theme = 'sphinx_rtd_theme'
html_theme_options = {
    'prev_next_buttons_location': 'both',
    'style_external_links': True
}
html_logo = "images/html/asgard-logo.png"
html_favicon = "images/html/favicon.ico"
html_static_path = ['_static']
html_css_files = ['css/custom.css',]
epub_title = project
epub_exclude_files = ['search.html']
intersphinx_mapping = {'https://docs.python.org/': None}
smartquotes = False
autosectionlabel_prefix_document = True
autosectionlabel_maxdepth = 5
# disable epub mimetype warnings
suppress_warnings = ["epub.unknown_project_files"]