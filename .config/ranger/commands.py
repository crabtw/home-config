from ranger.api.commands import *

class extract(Command):
    def execute(self):
        fm = self.fm
        for f in fm.thisdir.get_selection():
            fm.run(['/usr/bin/aunpack', f.basename])
            fm.thisdir.mark_item(f, False)

class conv2mkv(Command):
    def execute(self):
        fm = self.fm
        for f in fm.thisdir.get_selection():
            out = f.basename + '.mkv'
            proc = fm.run(['/usr/bin/ffmpeg', '-i', f.basename, '-map', '0',  '-vcodec', 'copy', '-acodec', 'copy', out])
            if proc.wait() != 0:
                fm.run(['/usr/bin/mencoder', '-o', out, '-ovc', 'copy', '-oac', 'copy', '-of', 'lavf', '-lavfopts', 'format=matroska', f.basename])
            fm.thisdir.mark_item(f, False)
