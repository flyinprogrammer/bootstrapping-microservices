# Alpine or Not

Alpine is great if you don't mind dealing with the occasional
[oddity](https://news.ycombinator.com/item?id=23080290) that
is [musl libc](https://www.musl-libc.org/).

More importantly, you should know that the old arguments about
disk size are malarkey:

```shell
❯ nerdctl images
REPOSITORY                TAG       IMAGE ID        CREATED           PLATFORM       SIZE
video-streaming-alpine    latest    8f232e24b1d4    19 minutes ago    linux/amd64    129.9 MiB
video-streaming-slim      latest    44843f74ba24    52 seconds ago    linux/amd64    199.9 MiB
video-streaming           latest    344b6c792afb    4 hours ago       linux/amd64    952.6 MiB
```

There's only a 70mb difference these days.

Not to mention, this never actually mattered?  Image layering and reuse
meant so long as you were building all your software from a common base
layer you were never copying gigabytes of data around.

We also live in a world where terabyte sized hard drives are pretty
standard these days, so I really don't understand why people would
sacrifice the stability of building software on [GNU C Library (glibc)](https://www.gnu.org/software/libc/)
to save a few megabytes of space in production.
