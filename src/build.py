from datetime import datetime
from staticjinja import Site


if __name__ == "__main__":
    data = {
        'tabs': [
            'Science',
            'Software'
        ],
        'now': datetime.now()
    }
    data['menu_cols'] = len(data['tabs']) + 3

    site = Site.make_site(env_globals=data)
    # enable automatic reloading
    site.render(use_reloader=True)
