from ranger.api.commands import *

class extract(Command):
    def execute(self):
        cwd = self.fm.env.cwd
        for f in cwd.get_selection():
            self.fm.run(['/usr/bin/aunpack', f.basename])
            cwd.mark_item(f, False)

class conv2mkv(Command):
    def execute(self):
        cwd = self.fm.env.cwd
        for f in cwd.get_selection():
            out = f.basename + '.mkv'
            proc = self.fm.run(['/usr/bin/ffmpeg', '-i', f.basename, '-map', '0',  '-vcodec', 'copy', '-acodec', 'copy', out])
            if proc.wait() != 0:
                self.fm.run(['/usr/bin/mencoder', '-o', out, '-ovc', 'copy', '-oac', 'copy', '-of', 'lavf', '-lavfopts', 'format=matroska', f.basename])
            cwd.mark_item(f, False)
