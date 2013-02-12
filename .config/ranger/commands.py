from ranger.api.commands import *

class extract(Command):
    def execute(self):
        cwd = self.fm.env.cwd
        for f in cwd.get_selection():
            self.fm.run(['/usr/bin/aunpack', f.basename])
            cwd.mark_item(f, False)
