+++
title = "Kubernetes Up and Running"
date = 2018-02-25T15:09:38-06:00

draft = false
toc = false
categories = ["technology"]
tags = ["hello", "world"]
+++

Well I've gone totally overboard with CI/CD on this simple little static html site. If you are reading this it is coming from my test kube cluster on Digital ocean and the image was automatically built by travis. More details to come...

*edit*
Well things weren't quite working as expected when I pushed that last commit. As a note, `kubectl set image` *does* require the use of a namespace when deploying a new image.
