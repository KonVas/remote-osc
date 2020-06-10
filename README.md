# server / client for remote OSC communication
  
## Installation
/server  
/client  

npm install  

Tested with node v14.0.0

Edit /client/config.json for address/port configs if necessary.

## Idea
This paper presents a new computer program developed by the author which aims to enable a telematic performance for musicians. The program manages the distribution of Open Sound Control communication protocol, which can be used as raw input to control sound/visuals algorithmic and generative processes among distributed performers using TCP communication. This can be viewed as a platform that creates a virtual ad-hoc collective performance while engaging in the musical outcome à la __to the parlour_ feeling. The program is designed in a server-client architecture to provide one-to-one, one-to-many, many-to-many, and also unidirectional or bidirectional communication to expand its use cases. It can communicate with any audio backend software that supports OSC enabling UDP or serial port communication (e.g. MaxMSP, Ableton Live). Moreover, it is also possible to send code snippets instead of controlling messages to any live coding software like Supercollider or Csound. Thanks to the flexibility of the program, visual art software such as Processing can be added to the list. It is an open-source cross platform software running as a NodeJS application. While still on experimental stages some tests are justifying that it can be used for sound installations that require raw data streams for sonification processes, laptop ensembles with remotely and distributed performers, etc. Simultaneous concerts can be held in different venues without compromising sound quality. The shortcomings of related projects in the literature and future work that is needed will be discussed as well as a brief demo will be performed as part of this presentation.

