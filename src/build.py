import argparse

from datetime import datetime
import os
from unicodedata import name
from matplotlib.pyplot import flag
from staticjinja import Site


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('-w', '--watch', action='store_true')
    args = parser.parse_args()
    
    data = {
        'tabs': {
            'science': 'Science',
            'software': 'Software',
            'ukraine': 'Ukraine <img src="images/flag-ukraine.png" height="15px"></img>'
        },
        'now': datetime.now()
    }
    data['menu_cols'] = len(data['tabs']) + 3

    site = Site.make_site(
            env_globals=data,
            outpath="build/html",
            searchpath=os.path.abspath("src/templates"),
            staticpaths=["src/images", "src/files"]
        )
    
    site.render(use_reloader=args.watch)
