from ranger.defaults.apps import CustomApplications as DefaultApps
from ranger.api.apps import *
                
class CustomApplications(DefaultApps):
    def app_default(self, c):
        f = c.file

        if f.extension in ('pdf', 'ps'):
            return self.app_okular(c)

        if f.image:
            return self.app_feh(c)

        return DefaultApps.app_default(self, c)

    def app_feh(self, c):
        c.flags += 'd'
        images = (f.basename for f in self.fm.env.cwd.files if f.image)

        return tup('feh', '--start-at', c.file.basename, '--fullscreen', *images)

CustomApplications.generic('okular', flags='d')
