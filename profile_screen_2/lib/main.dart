import 'package:flutter/material.dart';

void main() {
  runApp(ProfileApp());
}

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container( // Upper section of the screen
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30), // Adjust the radius as needed
                ),
              ),
              // height: MediaQuery.of(context).size.height * 0.4,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxITEhUSExIVFRUXFxcWGBUVGBUVFRUXFxUWFhgWFRUYHSggGBolGxUVITEhJSkrLi4uFx8zODMsNygtLisBCgoKDg0OGhAQGi0lHSUtLSstLS0tLS0tLS0tLS0xLS0tLS0tLS0tLS0tLS0tLTUtLS0tLS0tLS0tLS0tLS0tLf/AABEIAOEA4QMBIgACEQEDEQH/xAAbAAABBQEBAAAAAAAAAAAAAAAEAAIDBQYBB//EAEYQAAEDAgMFBgIGBwcCBwAAAAEAAhEDBBIhMQVBUWFxBhMigZGhMrEUUnLB0fAHI0JiorLhFTM1c3SSsxY0Q1OCtMLF8f/EABoBAAIDAQEAAAAAAAAAAAAAAAECAAMEBQb/xAAwEQACAgEDAgMGBgMBAAAAAAAAAQIRAxIhMQRBE1FhBSIygcHwM3GRobHRFLLxI//aAAwDAQACEQMRAD8A9Q2ntZlJpLnAALxvtv8ApTJxUrYydC/9kdOKxHavtncXjiC4tp/UB1+0fuWZSpDN2TXV0+o4vqOLnHUnNQpJJhRJJJKEEkugJ7Wq2GNsFnAFLTYuspokMW7HjSFbONbuC6RCewQi6Wy61TMMKtcox5dA0t8IBTg1WP8AYFeJLWt+05oUFbZtVmrDHHcjHNibpSX6keOaXAIEVSpKzo2lEtHxMImZzjKZ6LgtSOnEaIwzRlLT3BPG4qztgcOoRDjJ0TWM3I6jTAC0pGdsTKAAneiaV05ogHJRQlTic0aFOSkn14nJRohEuricFCM6GpLriuBEUaFISmELoQCPlJcSUCeaJJJLzRuEkkugIpNkOJwC6Gp4C048PmCzjWqVjE9tAxMKahRLiAAtiiooXngjhWVCg0AF2fL8V1tAMA0c72COF+ym3MBx4yG+m8rndT1rfu4v1NOLAlvMNsrZwgtLcPKNPLNTOvcNQglrmnTCQD0VEdstPw4mn6pIIPRwVXXNSo6MMk8Fg0OXxM0eJXBotodoGNlrRI3gx9yqHbdcMh8OoaZIHSdE+z7M3FQTgMZDPnKurb9H9w8hsQPrRxzRUYIDc5cGcvNql4JkiQRG7MQfzzT7PaZbk7MQDlxEkexMq/uf0c3LeGSzdfY9am9zHNIdociYHorYSS+FlU4z7mlsLum/TyRxWbsLI048RPRoxD3kCeS2extnG4+FwkZOG8cD05rq9J12p6Z/Iy5+npaogBXIWlHZkl2GUfS7HjeVtfUY13M3hSMXhSAXolDs7SiCBop6Gxrds5BI+rj5DLF6nnDaLjo0+i4WkHPIr0S5uLWmCMpWTvatFznEQOCfHmc+wJwUSmcZSC7UAnJJq0FR2FxPhPp0y4wEAkcLqJ+huSQtEPKUl0BG2uzXv3ZLz8YNm7ngDAT2hWTNjuJgI+37NOOZJWqEYxDokUAClY1a+n2fZCmo7DpDgr1JAcGZw3QwYQM1JaUYBJGogH3+5X1elbsB0lVGRa7Ad+45+iTqLeJ0HGkpblfdVy3UHqhbCxqXD8NNpJPDcpLyg456nkNV7F2A7PC3otkfrHZvPPh0Gi40msaNUIvJKuxlti/o3qmDWIaPq/181vNh9h6FHMjEZkTuz3LRUqSNhUObZrWOKBqVlTbo0DyTsMZQjAxQ1WickjsdNANamCsj2x2Gx47wNAcOG9bR7JVVtunLCMMiM1I7CzVo8OvqLQ+IDHSPE0u6DU66qw7HbRqUrxuZ8X6udNdJHpryXO0lAB5j03JbH2m1lSlUcAS1wJB3kHMei1QlumY5R2aPWbTZ9UuxEq9pWxjNCHbVENDg4QQCPMSqm77WsBhuZXVUZz4Ry265ZfPIaYWJ7UXD6b5Y7VRbT7QVSdIVJdXDn5uMrZhwNO2Vt7gz3kmSZXCE4BdwLWAYGp7Kcp7U5lSCiAY5kKazfBlR1XzmnU6BIlK+CB30rokgMCSXSg2zAbODB4nZlXtG9ccmM9kH2Zt2vOYW0oWlNg0AXN0pG9Ta4KOwsamLEVesomE2ttCm3eFU3faRjdE6hYrn6lm8gSFk9rXtRjiAcimXe33OOQVTXrueZKupFKbs66s46kqazfB5oemyUZb0DOQTOOpUTVTLTY1MVbqmxzSQHAnMxlB036L2vZ5yAXkPZKlF4wHgfkvWLfKF5nqVU2vI7PT/AA2XtA5o0tQlmzerAtVcUWyYwBQvpqdrlU7T7R21KQ6o0uG4EZIiphVTJBXFMEQUKztJTc2cLhwJBAPRKheioSYjrv6IUMZXtL2VFRrnUycWeR5cCvMauzScQghw/mC94rxC8+2tahlwQB8RkeeX56p4SoryQK3Z9w51JuImYiJ0jJTsyMq4uKj6dIW9Cgyo0uHe1HfWdnDY3jWd2Srr23wGPKF6PoupWWOmqaOV1fSvE1K7TIa1cu1TXJBqdhW5GJsYAi7SmDMqBoRtq0BBhAqzc0wBT3bhiyUBRQrEVJTrkCFHC5CjIh/eLqihJQJh9nXhpGUVc7eqOyGSqnPlNlYqRpJqty92rioV1Op05TEOQp6VFFUrSEdQtE6iVuQLRtVb2FvhMkKWjbgIkaKxISxbOyvaLhkDLZ5wcvZeo0HsDQ57gBxXlhJBBGrSHDq0yFqy7G8B7opOGKZjwxOZ3BcD2lg05NS4Z1uhy3FryNezb1voKrZ4Si6N+DkCvOq+2dm25w0bLv3OJAdBgkawY1zVjsltdtUVe4NKnIxNxlzRi0iRlzAKw6aVmxSt0abbN45rSBPiyB4Ssy2tZWxMUX3FZoLiRLogTA19gd06rbbYotqUojWNNfVUlHYr2OLqFNkH9p5JJ35mMtZQTGrYqbbtLXriTs2oxhyBc4NJHENcBPktDsehLcQB36gwOWeu5FWWzazjjqvE/VbMepVjXJaICMmuxIopNqkthZPbds59Rjm65j00WsvmOfM6e/mqljcL2ngVXF7jySoi7LOqOoOpVGBpaS8HiNWnrAjyVD2keDc1CNJEf7Qt48kND2MxPcC0AQNcXid+6JXnF3UxVHO4uPzXY9lK8sn6fUwe0mvDS9foMpOhPcVFKfK7xxGTtYAJT2vEIRy60FANjnjNMLUQyjKdVoQJUslAeFOaVwlIqAHZLqjlJAJ5qFLQpYjCY1hRtrSgyFkijTKSRNXtAABvXbe1Moylbl2ZVjQtgFaolLkQ0bcnVH0aScKeS4xxVvAh0iCmkrpShQJxola/YNqK9vgfEN8JmZwjOBmN0BZai1XvZy7wuLeOfmFz/aWLVhvutzX0M9OWvM1Gz7U04bRpsaBocLj5wYAPOSrC+tyKTy5xc4jqAeSIsn5SotqXQcwiYyzPAbyvPXaO447ktB+KiCeAXbG+aBniidQJVNYdoaPclrSH7tRmQdxVPY9prms40qFqCwEgvc7Dn+6I05lFRb4HbXc9AbfN3EO+Y6rj7ppWeu7dxY3OKgAlwmCd/UKhudrXNPJ1Jx/eZJb58PNGhVFGivKonVV7nIOyp1nw97S0SPf/APUddAARyVVUyWWdrtWjSoY3uAcARB1OsQN68xxovapmpnwhCQvSezcChj138X0OL12XVPRXA4J4XGhG29ERJXSsw0CsaVKxqMawLpooaiURslNrUyUfbluHNW1nsTG3EqpZFHdjKLfBj30Cud0Rqt9S7Os3rl1smkICr/yo9hvBZgu6SXoH9k0eXouIf5UfIPhHkvavsp9Er9212IR5jqg6FnGoRdXa7qjy+oS4kzJzJUFa7xnLIKYk1FauRZvfYLpgDRSBRWwU29XoQewEppyTi9MJTAHNCnpRChYpAESD2lEW1TC4EIZjZyWl2f2ce4AlVZnHS4y4Y+O1JNdiy2dttpEE58OCYdpioXBunwnnxCrq+xgKhaSQRqRlLTofmPIq3utk91SmmBkMQ58epXk3Gm4no4ZLVmfr9jxVypDu85DhoJ1xBajZNpb7PoxWuGjLUnPnzzKwD9vXNat3dQV6NAa90wueRxIEnn6rT2Ne1GdCwr13lsYq/gaN2ZqZic9AVYk6phc12TDNpdu7RoJaKjgN+AgaZZuTuz+3XXRL2W9YU/rvaxrT0BMnyBXHbGc8ipdYHVIAFNgIosDSSCGH4nCfidnwhauza1lMdEsqXAWnW4JeNDaTRoZb1+L8Fltv3eF8Aq7v3OdUbwb4vTRYXtTew93HQBIlbBdIGrVcZJ5x7JMCq7pr22+NvxNc1/UE4TPKHI+zuA9geNCPQ7wvRezsqcPD7o43Wwanq8wloWlNKj3EyJj3WYxJ4qGIW+Ub7mNOg5rlNSeq+nUV9ZWLTTxTmlm0kFbgzWK6sLupGEKsbDSj7WsA8Qqcm6Cm0XNG3qnUoyns+dU+lesAklC3G3GjRYHqb2Q9+bDfoAXVTf8AUCSnh5CXE8Xu7fBlGajt6WavXVWPcXFQQAZAXRjwU96OClhT6QTDXxFdIVqAzpKUJAJ+FMQ40qemo8CnpU1CD6eRlabZ+3qjgGNbmsw5pCuey9wG1YO9VZopxugqTXBbXdvcOHfYZLAZb9ZupHM7x58URsftJTAFKpBY74HnQ/uk7j80Tt/thbWYGMlzyJFNkYomJJOTRK8s2d2qYKjxWYO7qPc7D+y0OcXAA7iAYnfC891UVKVrk6vSZGo1Ljsek7atAT3lIThOYGUj87kPTvqzhDRHlB4IbZW0mMc0Y8VN3wPn+Bx4rVUKlPIgj2WNOjpRyOqBtmbNqE4n/wBVb3QAbJzjOEJW2oG5kgDisf2m7aNALKZxOdllnCZRchZS7h219tNbiMxl9y87c51aqTxPoF26vH1MieqvtgbN9TmeQV0Y6VZWrYxlqDTe0jItc3+FZHYN/gdgcfC72PHovQ7+mMLg0R4T8l5KHQRw09ck3T5JQnqRT1cU6TN+KakwKn2VtloaGVSQ4ZYokEbuc/grqjWY8S1wPnn5jVejx54ZFs/kceWOUeUMhW9gxxbvhV+FW1tdyzCBnonyXWwq5GYM1PSyUIyTmuVbCEVq7uKHFRSPOSiY8BKkE7JXUz6QElNyUYsKVqFwrgqxvViK6J60Ayh6tzwUVSoSVJRtpRCHbPrDein5nJC06YCMpp0gHC1JpIUzhKHq3QbkMz7T1SZMkcauTpBjBydIlLidVWXW2TTM0yAZiTn6KC4vHGZPl/RUe0auUfkFcnP17ye7j2Rth06hvLcI2pUfWxOeS5xEydZGiqGuDgJ6fh9/orahVlmM7hn03qrr0SC4jQO/P3rEWNk+zto1aDjTLvCf2XfCeGe7qrgdpK7PCKj2/uvEx0dvCpSwVGDcR5/kKFty9gwPAe3dnoDvY7cPbkioxb3GhkrZl/cbfr1cn18uAgD2XLZg4yqOjXpYhMx+dVf21uI8M+6t8NV7rNUGpFnY0JM8Fr9njCwk6nM/cFnNnWlQQC057vxWusbYuGYPSMlnyPsaUkgdsuDuhXkLGyQeY5bwvc7izFK2q1DuY5x5AAleJgeIDhy4bvUhLj7mPqXugm8pgjEOJmOqZQOh3jXmEUxmURlmD1Me/JCDJ0DQjLrp9xTFKZZ0ruoB4XkDgrHZ/aGtSM+F/wBsfeIVJRduCeD+KZZckdlJh0xfKNPT7U4z46YH2D9x/FWNHatE6VGzwOR91hiYT8QyMrRj63JFb7lUsEHxsb8vlce1Y232jVpZMdl9V2Y8uCudmdp2SBXbG7E3MDmW6+krbDrcclvsymWCS4LbAuqX+0rT/wA5nqkr/Gh5lXhyPNnXJOQRmzrUnVK2s1Z0QBkrkipsi+jAFG2rW5yo3NhC3d2GDMEk6AR8yjOUYRtvYkU5OkFOGfJdq1QxpJ8hxPBZ6veF04s26EHIt4eXNOLssHAZcwudP2lyox/JmqPTebJn3jnHMnnnkonVDPJQ1DEHyUhhct3J22arrghqTKDu2BxHkUU93nw4mOHDqhbpkCXeg08+KKQjY0VJGECeQ08zw5JrqRIIOsGI0HRE27IASe2IPAogANnXBB06jL1z0U97R4ZjWCIPOIyPkhLungqSNDn+KsLesHsM7o9zCJCB4YWNq+HJwa8MYGOaBocMw8ETnGog6hen/o7osLBTqua9hA7moAPG0ZFofqHA6sd4hO8QT5VWeGVIMwJBG4iTkRw0Wy2XtGjWNtRpuZRFMB1Rzn4S4jURlmQSIBz5QpL4S3BtLk9kZsmm0y0AeSLp7ObrPkAgaG3rbCA64og86rPvKsLO/pVJ7qqypH1HNd64SsbbOgZ/9JdyKWz6jWwDULKY5yZd/C1y8Nt83eep4Nz+ZHovVP0v21y9lOoxgfQpAue2YLXfXM7g3LzPFeXbIwOcS9sw2AJJEmTmQDEkDcfNXY17pizv39wu+Y1hkOxGNxa6S6WgS1xHvOkgaIbB4AN/zjX881JtdgpgOnIuaAfFHwS6MpwhxIHhGQCAp7SDSJ7s5azUnyy+5WUyrUg2i+denQ8lLhOoPkc/fX3UNrXpVPC14DjlhOIEndhMQc5ykHSJU1J0jmNUu6GTTOOcfqnyIPzhMNRuYMjqCOHLqpSEgOKKA7H0ajXCA4E8iDmm91Mjh8lA+JzAI5p734MJG8xqSB5bh0RomoUOSTsTuI9f6JKaQa0XDAu71xIFelOUEB2Sz21G4qjxOkD+EK7lZyvW/WF05OJz5blh9oS/80vU0dMveYLbVzJDtW6j6zDr6a+qsLUSC0nNuh4tPwn880DWBa4PAkt1/eantqBokZtAJaeNM7urT7Fck1WHuZI6H34KB7jMDXno3Q+LjxhSsq4mgt1iOMD60cdw6FRVCG+EfnqoGxzGgcSd53ncg9sGBCL5IPbA+HqoTsE0PhHROIkEJ1IeELgyUIAX1LFTDt7fkq+k7CTzGvuPeFesaJIOhVNVowXN+qfVp4IoDJ9rUw6KrdCMxwg/MAgHnyIQFLorC0dhIkyx2/UTo1xHsRvBUd3bBlQtiGuzaDnAkgid8EOHkihWMp0+SnoXb6D21qT3U6jTIcwwR+I5HIqCi6DhPkn12yCEQIM2t2ku7sfr7h9QfVyDAeOBoAnyUuwWNLXBwEkw0nEAHYTGbRiiYmM+EaqqpCArrY7ZpOykF3uEOENbb3G9qGwwAOc5veHC52pAbE559JziFngzKVfdoGnumAn9okCc4jhuH4qqayFEBipWoOp1Eq3p3Hwk6kQ48S1xAceZABPEyd6E2dhJDXbnNHkSAk2oXF3EBpgdJPpp5BKx4FvzCY/ilbmWhKcyEhaR1BiHNNb4mEbxn6Jz8k5gzlMmVtEP03kPRdRH0dqSNi0WocuhRgJ4Xo7OdRDtGtDIGrvD5bz6fNZ+uzED7K87QswOwcGtP+4T+HoqKnWGhXF6vL4mT0RuxQ0xO0nl7JHxs3cRwXcIAxtjDOIjhlDh6SlQ8D8Y00I5IivTwyf2SMXruWYcisxhJZOhgHlqPZPu2+JQOluF2WUNPVgy/h+SsbwDJ3EKEQNXMQ7ootrN0SefDGuYI9Qi76lIUIcoDILr2JlmckSoEFqDKeCG2lT+GoN2TuhR7mZFNpMxNLSoQqGNwuwH4HyOk/kIm9HeUMR/vKZh3MZNMcvgPXEo30C5hYdW/dofRSWNQOyJEPbnxlowuH+wz5Ii0VuoB3hTB857lDQESDu+YUjBHQ+xTCiZlPr6oi3ruYZafI6FD7/ZKk7coQfd1XPxOcZJ9uQG4JsZK0s+z13cUX1qNtVqUmAl1RrfBlrhJ+M5aNkomn2Rvvo77p1u+nRpsLy+oCzEBA8DCMTtRnEcSFAlRs+O8bulzPZ4n88k2g/BWE6Oa1v8LY+5a3anYapbWZvhWbVNKrSLmMacPc1WhzKwccyC4hugiHawsrc0AYAPJp+yMp6twHzShRY2uRLOHy3J1wzNvOR7GEJRrEhjzr8DuoR158M8CD6FLRZZCWnDO5SW7/OOv3Ap1LR7eBPoUHZ1CDygAnieSgGyw7zl8/wSXJH1kkQWWjdU54CbSzIXO0TxSoue056DqcpXoZSUVbOalbM9t3as1tcWFoafKfx9lA3BUzaYKqm0STnKLZZb2kgrgzeqTfmdCOyoI7pzVY0ZLQNZI0jRgnrqR6qnN1UZk8TzVjY3OMDCYIGnMuM/d6JSDatH42ayMTD9nUdY+SlL8dvzhOrPnxQA9pxRudxHWMlBZuHjYNNR0IkfNAhzv2FoGcwOm5Wp4clnqVTKODgPKZV+8/JQiBWtwuI3IgnMJtTxNneFw/snmoMSuao6TdVORkk1m5AgFd04eHbneE9dyCotweKMm1ActcLvCR6K4r0MTC3eMx1GiCpNDqbpMOIyAyEjj0IRIwwdjrquala3pF4kS0QCSQMWATmcR+HIw5sTnAH/AE9eYxT+h3OM5Bvc1QT5YVvP0XEVK5puZXeKlJo/Vx3Dcyya9PUjHgOMaGZyJWnds+8GIMvmMp72u+kkNEka06gY9sgjMN0IOYKjk0NDHGS3dHlW2ew93b021H9255cGut6T+9uGSCQXtaCBpoCTmMlZdnOx1SkReX9EU6LAXso15a6u4DLFS+IUW/E4uiQIzlbazs6DTLK9zc1WmDUomqLelJLXNw2zXU6YAJ1e5w1yU+1dmNxsrXVXvC8Mw2tJhivWYA0hwce8rjGC4MADQIxOjMy5UMo4U7t0v3/pFhscXNe2qVqzu6aXU3sbU17qix9Ufq2kNtQ491hymGyZJBQlLahFw2zuBk+k36RBc5tZl3ipOwYsxTpu7vM6AOyCsNjvdVpuLsFR/ePY8uINKn3jaTzSYSD3sllMOeW4iXlzcIIBzvamgB9Hruz7uo61rFu+jdYixxO4Cu2rHJwStbbFsJXOp1T2quLVft/0K7FUx3NXZ9yZ7p9TZ1ecppVCfo1Ub8nnA3/MleTbS2e+g59Gpk+jUNN2REmm5zJHItdTPMZ716o8E7QoVDiw7StX29YsBkXVsC01BGhGAQecqi/S3sp4rUrlzQ2pc0MNVjCHBtzSa3EA4a5sY3dom5MrTi6Z5/QE426Ym4h1br7EImlVx04OoEIei6HNdxcPRwiPf2XaBwue3mVAoKoVNSZzY05cYj8UI0EiYGTjv58FPbHTPc8ejiUFcOIBABPi48goQM73kF1Vf0s/V91xGgWbIFBbeqnuSSJgtMecfej3EIbaRaKbgd4iF3M1eHK/IxQvUjOGHjn8kxpcw8Qu1RnLdU+ldNdk7wnnoVwjcEAYv66IJ1k4GWZHXLr7aFH0qWcA6wB5qZrScx+RoPYe6gKAWXxPgqiHbnfjxUNtULaoB6co/JKtq9Br2w5sECZ/AqiuqZY8SZjQ/wBUUBk9VsPeOQcOoMq9mcPQKjvHeJruII9lbUnyxp4KEH2rvE5vVOqjIdVAXRURdQgwgFEm71SpjVObmEqY/PRQI9kjggadPDWc2YB8Q0GRGYz5/NG1NEJtSP1VQxk4NI4g5eigLObPv3W7adam97X0KuKGGCWB7XYcolpGPLQr17a+1gL3uXsa5r6lSDm0PDWNuGsqNaCHtdTc9skE6arx+kA4vpT8VUAN1PjBpzM7sa3jbjvH7IrnMVDaNeeLntfZVP5G+qEuxbhp6l6P9t/oa/auym1DUxl57pstaxwa0CCcRZiODRpwy0Q/Nu4i1aGOjLHtphxGI29PvKpBa1j2fDLMwwGcTQGZggZA0do16RtpqOhlT6M9ueCHgCiYOXh7+2z40X80NT2223aKVa3c63fE1sTn0qZcwZVGuccLdxkQJ6qJDty2d9tvT+uCxo3DWWvhYzu2lzcE4gWSO8AfJDnR3jnPky4OAJgudBR2YbqncWj3GHU+7NU76jSDRqgSMTi6gxwaM4rqq2btepUrUm12inTm5D2TkGMNKiAdAS4tewQAIcYGWehO1Wsr0g0lmbrcGAPEDTDDiGcOJo5Ymhw1lFbFcqa2+/v6hlOoG2jwwva5hbWc0VmUqjiIbVZcVwHU6DfC1zmMdIDHTJOdX25w3FjUdT7s92aV3T7oHCQ+WuippVkio4kZxEjSXWG1mMvXWxYe6LqUOcZBoXrfCKdNrWsa0PcxpkOnC6TJlBdmrurcUqttcvL6jKl3YVcg1pL2k0qmEZCHUywQP2lI+RMttqb77/3+55C2nHeNH7JcG9AcQPoo7+pFUxvAPqE+zzLpOZY09SG4XKG/ANVx3AD5BEqsJsicLelY/NAXTzDvtfcEdYgYWfYqH1xfgq+7iDu8XvhChAJJJJEBvuCA2zp/6Skkur1n4L+X8mfD8Zn7f4ih7zVJJck0ss7L4R5/JRU/iSSUIXL9PI/JUW0/z7JJKAO3Xws/O5Wlr/dH87lxJQgqn94On3BEnQLiSAQ22+FMpbkklAnTqeiC2n/cnqPmkkiAl2L8Tft2/wDy0lr9nf8AabL/ANV/9muJJZcfp/Jdg+L5S/1ZoO0vxVvt23814qjY/wDidz/k/wDwqpJIrkaX4S/J/wAoo7TRn+ZYf892tHtD4nf6zZ38tskko+fv1Fh+G/vvE7tX/Eaf+htf/clG7H/xLaf+vtf+VJJCPLDl/Ch8/wCTx+n/ANwfsv8A+Qoe4/8AH+0Ukk5nJ7D9j7A/meq673/bPyCSSAQVJJJEB//Z'),
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'User Name',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '+1234567890',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Bottom section of the screen
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30), // Adjust the radius as needed
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Account Overview text
                  Text(
                    'Account Overview',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20), // Spacing between the title and rows

                  // Rows for account options
                  buildAccountOption(Icons.person, 'My Profile'),
                  buildAccountOption(Icons.shopping_bag, 'My Orders'),
                  buildAccountOption(Icons.receipt, 'Refund'),
                  buildAccountOption(Icons.lock, 'Change Password'),
                  buildAccountOption(Icons.language, 'Change Language'),
                ],
              ),
            )

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: (index) {},
      ),
    );
  }

  // Helper method to build account option rows
  Widget buildAccountOption(IconData icon, String title) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.grey),
                SizedBox(width: 10),
                Text(title, style: TextStyle(fontSize: 18)),
              ],
            ),
            Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
        Divider(height: 30),
      ],
    );
  }
}
