from ranger.api.commands import *

class extract(Command):
    def execute(self):
        for f in self.fm.env.get_selection():
            self.fm.run(['/usr/bin/aunpack', f.basename])
