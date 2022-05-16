**Is your feature request related to a problem? Please describe.**
AutoX is the much discussed Iter8 feature which launches experiments automatically in Kubernetes when new versions of Kubernetes resources are created. Design and develop this feature.

**Describe the solution you'd like**
AutoX controller should be installable as follows.

```shell
helm install autox iter8/autox \
--set groups.<group name>.chart=<name of iter8 experiment chart> \
--set groups.<group name>.resourceKind=deployment \
--set groups.<group name>.namespaces={a,list,of,namespaces} \
--set groups.<group name>.values.x=y \
--set groups.<group name>.values.x=y \
...
```
In the above syntax, `x=y` are the parameter values you would set when launching the experiment using `iter8 k launch`.

Following is an **example** of how the above  solution can be used. Set up autox to kick start a `load-test-http` experiment whenever there are changes deployments with an iter8-specific group annotation.

The following command installs the autox controller. In this example, the autox controller operators in the `default`, `test`, and `prod` namespaces. Note that `default` is the `helm` release namespace for `autox`, and hence, it is not necessary to specify it explicitly as part of `namespaces`.
```shell
helm install autox iter8/autox \
--set groups.hello.chart=load-test-http \
--set groups.hello.resourceKind=deployment \
--set groups.hello.namespaces={test,prod} \
--set groups.hello.values.url=http://httpbin/get
```

The following creates a deployment with the right annotation, in order to trigger an experiment.
```shell
kubectl create deployment nginx --image=nginx
kubectl annotate deploy/nginx iter8.tools/group=hello
```

A few seconds later ... you can view the report for the auto launched experiment using familiar `iter8` commands.
```shell
iter8 k report -g hello
```


Should automatically trigger an `http-load-test` for the `new-sevice`.
