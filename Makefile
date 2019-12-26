# Build them in MinGW 64bit environment

all: sma-hs.ex5 sma-hs.dll

sma-hs.ex5: sma-hs.mq5
	-metaeditor64.exe /compile:sma-hs.mq5 /log:log.log
	cat log.log
	rm log.log

sma-hs.dll: SMAHs.hs begin.c
	stack ghc -- -shared -o sma-hs.dll SMAHs.hs begin.c

clean:
	-rm sma-hs.ex5
	-rm sma-hs.dll
