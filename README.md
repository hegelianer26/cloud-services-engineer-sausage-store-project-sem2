# Sausage Store. Итоговый проект второго семестра 

Финальный проект — интернет-магазин «Сосисочная», развернутый в Kubernetes с использованием CI/CD, Helm и автоматизированной доставки.


## Доступ:
https://hegelianer.2sem.students-projects.ru/


## Pods:
```
NAME                                          READY   STATUS    RESTARTS   AGE
mongodb-0                                     1/1     Running   0          24h
postgres-0                                    1/1     Running   0          24h
sem-project-backend-6b8bbcd7ff-mhwns          1/1     Running   0          9m19s
sem-project-backend-report-79d6dc5cdc-72gg7   1/1     Running   0          24h
sem-project-frontend-bd49d948d-tznrd          1/1     Running   0          24h
```

## VPA (рекомендации для backend):
```
Name:         sem-project-backend-vpa
Namespace:    r-devops-magistracy-project-2sem-816697651
Labels:       app.kubernetes.io/managed-by=Helm
Annotations:  meta.helm.sh/release-name: sem-project
              meta.helm.sh/release-namespace: r-devops-magistracy-project-2sem-816697651
API Version:  autoscaling.k8s.io/v1
Kind:         VerticalPodAutoscaler
Metadata:
  Creation Timestamp:  2025-09-15T13:38:57Z
  Generation:          1
  Resource Version:    81600401
  UID:                 dbc8ccfd-c388-4d63-9a96-9dd049091a03
Spec:
  Resource Policy:
    Container Policies:
      Container Name:  *
      Controlled Resources:
        cpu
        memory
      Max Allowed:
        Cpu:     500m
        Memory:  256Mi
      Min Allowed:
        Cpu:     50m
        Memory:  128Mi
  Target Ref:
    API Version:  apps/v1
    Kind:         Deployment
    Name:         sem-project-backend
  Update Policy:
    Update Mode:  Off
Status:
  Conditions:
    Last Transition Time:  2025-09-15T13:39:13Z
    Status:                True
    Type:                  RecommendationProvided
  Recommendation:
    Container Recommendations:
      Container Name:  backend
      Lower Bound:
        Cpu:     50m
        Memory:  262144k
      Target:
        Cpu:     500m
        Memory:  262144k
      Uncapped Target:
        Cpu:     1168m
        Memory:  262144k
      Upper Bound:
        Cpu:     500m
        Memory:  256Mi
Events:          <none>
```

## HPA (автоскейлинг для backend-report):
```
Name:                                                  sem-project-backend-report-hpa
Namespace:                                             r-devops-magistracy-project-2sem-816697651
Labels:                                                app.kubernetes.io/component=hpa
                                                       app.kubernetes.io/instance=sem-project
                                                       app.kubernetes.io/managed-by=Helm
                                                       app.kubernetes.io/name=backend-report-hpa
                                                       app.kubernetes.io/part-of=sausage-store
Annotations:                                           meta.helm.sh/release-name: sem-project
                                                       meta.helm.sh/release-namespace: r-devops-magistracy-project-2sem-816697651
CreationTimestamp:                                     Mon, 15 Sep 2025 20:38:57 +0700
Reference:                                             Deployment/sem-project-backend-report
Metrics:                                               ( current / target )
  resource cpu on pods  (as a percentage of request):  1% (1m) / 50%
Min replicas:                                          1
Max replicas:                                          3
Deployment pods:                                       1 current / 1 desired
Conditions:
  Type            Status  Reason              Message
  ----            ------  ------              -------
  AbleToScale     True    ReadyForNewScale    recommended size matches current size
  ScalingActive   True    ValidMetricFound    the HPA was able to successfully calculate a replica count from cpu resource utilization (percentage of request)
  ScalingLimited  False   DesiredWithinRange  the desired count is within the acceptable range
Events:           <none>
```

