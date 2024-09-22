import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.settings, color: Colors.grey),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Picture
            const CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage('data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxISEhUSEBAVFRUVFxUVFRUVFRUVFRUWFRcXFxUVFRUYHSggGBolHRUVITEhJSkrLi4uFx8zODMtNygtLisBCgoKDg0OGhAQFy0dHSUtLi0tLS0tLS0tLS0tKystLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS4tK//AABEIAL8BCAMBIgACEQEDEQH/xAAcAAABBQEBAQAAAAAAAAAAAAAAAQIDBAUGBwj/xAA+EAACAQIDBAcFBQcEAwAAAAAAAQIDEQQSIQUxQXEGEyIyUWGBByORocEkUmJysTNzgqLR4fAUQkPxNJKy/8QAGQEAAwEBAQAAAAAAAAAAAAAAAAECAwQF/8QAJxEBAAIBAwQCAgIDAAAAAAAAAAECEQMxMhIhQXEEMyKBI1FCYbH/2gAMAwEAAhEDEQA/APDQA0tl4GNSNRtu8FdE2tFYzKq1m04hmgK0BSSAOSNHE4KMaEaivd7yZtEYyqKzOf8ATMAUCkkFHQWq5mjtjCRhlyq10TNoiYhUUmYmWYA5IGislg0DR2TQjJvMrlbH01Go0txMXjq6VTTFepXAuUdn1JboP10v8SDEUZQeWUWn4MrKcIgAdFAMGgTZRjQZGDALlVrLBW5laQonJzXBgWJEtxYr2vH0DqHSrSpSSu4tJ7roblfgdl0qglhaTslu3LyMbB26rcc+n8jrp1Y84bX0Om/TlitDqdJydopt+CJcU+0a/RF+/jzNdTU6aTbDOlOq8VYlWhKLyyi0/BjcrOj6aK2LfJGTV3E6er10rbG8HfT6bTH9KADmNNmQAAAA2uj2say/AYpsdHHrV/dsy1uEtdHnDIYBIDVkU28WvskH5mIjaxH/AIkeZjq719t9Pa3piACA2YH0965o2OkMr5OSMaG9Gxt7u0+Rjf7K/ttThb9MeIrGo0KVCLSujS04RWvUNnVOrvNp2ei8/iXo4GTbqWTvqra5W9109P8AoJShGjG8MzjKy9U3d8ret/I2Oh/R/FYxSdK0KSds70i2nfLFLvNePAiMcmvTParLx9Ookmm7tarfq7p3T4aX9THruV0ptuytr4f9no+O6F4qG6qpefy+GrOW2hsGvB60m7K2mvLd6ji8T5FtK0eHOUYxv2r+jt9GPqUkn2U9H43LLw7g+1FrmuGn9/kTYXBupK6aSWuvFW3JcXwt9LtWywziNljE0VF2vqt/k/B+a4+ZXApWcNTzX/CrlaRqbHinCs/w/RmWyKzm0x/S7R+MSd4ElT/b6EY6T3FJdb0rn9lorkYGEl2Dd6Tv7LS9DncO+ycXxo/i/c/9devP8n6hVxHeNXoq7Vk/Mya+81ei/wC2jzOjW+qfTDS+yPa100d8VfyRjzehs9Nn9p/hRiy3EfG+mnpWv9lvaoxBzGnU5pACiAAanR/vz/dyMsv7Gfbf5ZfoRqcJXp8oUpCCy3sQtANef/irmZBrZvs1vMy1PHtrp+fTJAVAasiw3o2Nurs0+RjxNjbT7FPkY351bU4WYyLEMS0rEERWazGWcTjZ0vQvZM8fiFh7tQ79VreqcWr2823FLwvfgfQeB2dCjSUKcFGEVaMUrJJeBwHsO2Q44atiWnerNQju7lLiucpST/Ij0ydR5dxz3ju7dHtXPlzm1IvV3ORxtW287DH103bj4fU5rauHTb4+Rj04dfV2cpXpddK1tNfSxibSSoufVu0pK13uitL5Tc2liOq1ju1/7OI2jXU5XOnThwa0qtd6kVx7l6/5+o2fkbw5FnAztmSTu4yXpZt/NR18mVWPozs0/wDNwxk47qz2PYPgDEAOr6SO+EpehztF9k39vzvhKXoc7SehyfGj+P8AcurXn8/1CGrvNPo4/ex5mZVepo9H371ehvq/XPpjpz+cLnTFfaF+VGPLca/S+/Xq7/2ox2zP4/1V9K1/st7V2IKxDpc4AAAAt7Lnafo/0KhZ2e+2vUm20qryhBPe+Yg6pvfNjSi8hmlB/Z3zM00Kb9w+ZF/HtdPPpnisQVloKjY2wvd0zIga+1n7uBjfnVrTjZkRHSGxHWb0Su3uXFmrN9E9Cq8YYeiqWJjKE6VKSovLmpOcYyaTT89VzZobV21NSdGlk6xtpOekYq2sn5Iz9l7Nhs/B04z1cIU87vfNUirtK/BSbt5WRyex6ssXi51J9qLjOOXwT489DntPfs9LTr+OZX9sxxsJKc61GfDsysuWkfqY0dszbcZxyvg+D5HT7T6PR6qEKKyRje8pNylZycsvBtXk7JuyuZNPZCp0nKo72vl4tWe9thbBR1Ycvtd6a7vB8l/VnGY2klLT4eHiddtrERzNJ6R1OVx7Wey+PiuBppubWUJDTQp4aGZ53Jpa2ha7XN7uBVxVHK9O61mjffa7WtuOjNIlzzWY7okxLgBSTmKNcvIdwFJw6TbTvhKfNHP09xubRV8JD0MOnuOX48fhPuXTr8o9QjnvL2xH7xFGZc2O+2jbU4Sy0+cL/S1+9j+Ux2a/Sp+8j+Ux2Z/H+qq9b7JRMaOY06HPIAAAAmwffRCSUH2kKdjjclXe+Y0dV3vmNQx5DNCj+xlzM9l/Dr3UiL7Qum8qKBi2ELQdFmrtGXuoGSamN/YwMr8qtabSzIo1OjcL4vDJ8a9BfGpEzCbDYiVOcKkO9CUZxvuvFqSv6otEPcfajjZRoKMYytfWSTaV+S/zQwegK6qtBRzShUhKpGbTTTTs3Zrc7v5HoOO2xRpuUJqd42clGEpWvrbsrec2tsUIy7E0k9yknB/+rsznx2erEefDf2xUyxucTtPaF0809NdOL8Dc2xinVjlhvtdO+lt1/mcVTw8pqUqnC6tydv1sSLT27OL2hXk6krviVqsszvotF8lb6FzbK95z/wAZFgaWZuWnZ11OiJxGXnTEzbDR2ZhE8NiK1S9oxjGm/vVajSjBPjopSa/CY+0cQp9XFK3VwyX+888pN/z29CztHGxt1dKUpRtduWtpvv5Fw3JX3tIyyqx5TqW8QSwoNAmWyCiKLnuhBG38fL7JH0MSG42cY/skfQxYHPo8Z9y31t49QbMubH76Kci3srvo0vxlFOULvSZ3nF/hMk1+kvejb7pjkaH1wvW5yjkNHMabsJAAAEB0N6EAAdU3saAAYZfwr93IosvYP9nIi+yqbqbGjmNZUEU08X+xiZhpYmS6mKIvvHtdNpZ4stwgr3FofSGAxKxlCGKozyxqxztWWs3eM1J+KcXH+E5rF7MTnmqNz13Wtr+piezfplRp4aOEqyyThKXV37s1OTla/CSlKWj33VrmxtLbmWTspZrvRpp33bvIwtWdoejTViad5X9q1lRpdVFJSst3xscnXq5IuLer3+bbu/mV8TtWpKbc734FWcXJ3lIUU/sp1M7Oe2xByn2dSlUo5VqdNVpJd2PrxKGKwTabNo7Oa1c93OTQ25bnh3mS+PJasqzVmaeHPPaRKV940QWIEAuK0NANaeKUsNl4prQz4ESkSQM4pFc4aTbq3JIs7NfbRWkWNnd8LcZFeUL/AEhWseRkXNbb71jrwMkjR4QvW5yaxg5jTZjIAAAigAoGQLgIMjmXMH3JFIt4R9mRF9l03QMYxzEY4IGhXXuUZ5dnK9NRvqTaJmYVWcZVB2W+4khR8SxCmXEJyjwlB38f8+Z670WwNOeFwEa7llrSxdFzT7UakakupSburKNKaUbcTzjCUcqu956b0aw8q2wpOmnnw+IqTg1vzRyVlbwu5OP8QXr+MzCtOcWjJ+1OhTpydqjkuErWfqc5idiTi9Jv4HomxukVPF0IzVs1u1G6un4x8Ysz8Rg05XW4wiXXNZhxENiye+fy/uPp7Nte52WJwiS3alWjs6NpVKry0aaz1ZbnlX+1fie5f2Ljvsme0Zl570i2XGhRjUbanXk1Tjp+xh35vj2p2it2kZb7o4ytvZ03Sba8sVXnWayxWkILdCnBWhBeFkcw2bYx2cczmckAkoLUllSuGCVQJJ0yMQISwIiSApOCSLGA7yK8ibBvtE22XXdf27/t5GUaO1npG/gZxGlGKwrV5Saxo5jTVlIAAAiiiCjBAFEYgC1hHpIqlnC7mK2yqboWOjSvYIRu7FuEe1byHWCk2nQsWKeHuWadFcSRovBIFRQui3E9Pd6iVYJ8BhLB6HpnQurKns7DShfWviK7Sk45urnCla68VGa+J5nSVo+h6z7HEqlJOSv1VNRgnujnnOcrLxbnL4lQGjtvAqrRljacOqqQu56W62np25cHJX38Vo9ytj7L2nPMlUSlC61TaaX15HpWHgoyVJ7l3POG7LzW7lbzMPpnsilSpLE0acYSjOOfLFKMlJ2V4rS+Zx182Ya2n5h0aGr/AIWQbVwMbZm8sYJyk/KKu+eiZzO0Jf6yhUw8Lxi1pr2YSWsZyel1e1771ppol1UYzxOEk0leUHmu2o2vaXnuTOPlPI+opWk5uMbx0TvuSvbe3xL0KxjKNe056XkmNptRytWk24yT3xyvtJ+uhkyWp2ftIpqni5U04uUIQVVxvZ1Gsz1e/sypq9lqnxOTdO+4qWSGm7NFxMrSpeLJZS3W3vcIHSiVp0yxJ2GtAFRxHwJJojqRtZeWvqTMHBJMlwrWZXK9wuTMdji2JaW053SKArrNqzYhNa9MYVa3VOTWNHMSKLQQB+UAGDQEFGQBgAAWLGGe8gZLQ4k22VXdLhIXZcS96l+Eh2WtfiWLe+XJlxHZMriQriCFZYMhxEQqGoQWKavFnqnsTqReHqW0lHJFrx72vyPNNn4hOnVoTaUKiUrtaxqQaytOzaWuvI7f2O4uarVaUKOWKVpZpLRxcVPi9VK9ufAcT3D16qsyTXei7x5rgQbZyVMPVpTqKCqQeVyTlllweVavLJJ2XgTqSWrdktW/BLVs5iOBnjK7qSbjTsna+sk5SSS8Fpv+G+5Uxks4lK9uQpUv9NgqM5uMcmdq+rWs2lvevGyXJWMHZuwZxn/qMS1ThT941dSlaHabbWiWl97fI63BNZXaKis9SyWiy55KLt5xsc17T9qKhgKiT7VZqiuUryqemSMl/Eg7RHYZmXhO2sdKvXqVZ96pOdRp62ztvL6Xt6EEFoRJ3dyacNDM0NRiUFe78NF9WR13dpImTsgCKtIIsjmxIsAlhq9dy1fJf5YrTldtk8tI3+8/kv7/AKFcUgAACBByEBCAYsBGCYGkzARtgAyQUQAIoAKgBCWhxI2PoveE7HG7R2etVyJ5ftY8n+gmDjpf0+A99+Pr/wDLNCWBWgQ5jBkSOKJELl1EDmrQk/JnfexmLU87k26kJSl+WNk5PxeaVJepwdVdh8md97Eal+sUvuKMPJRleXq3JekEONx4er1454yjwcbej0fybJsHC09N3d9Ipf3Ei7LXy/qE3alKSe+MpJ+bXZt53NPCVDZzz0aU/vU6b+MEzx3207X6zExw0X2aEe1v79S0pc7RVP1uey4uvChSnUlpTpQlN+UYK7S9EfL+1cZKvWnVqO8pylOX5pNt28rsi0+DQUoklV2QkEQYqd9OHEg0FPV3JZyGxQ2bEEcxtx0hsHquYBLinqo/dSXrx+ZAOqSu2/F3GiAAAAAEIOQgRggYIAdIBAAzQAAIoqEAYKySitfUjuT4Za8hG16UeyghFZkvDX5W+o6GiXIbhneUvHT63+hoSykSWGxJBmilEdHcE1oRKdmIk77r5HX+xap73L+8X8rf0OSy6M0/ZrjJU68VHR9YlzUnaS+DYze+45PqZuPeSdubVvqNhUk6FNSg4yc6cVF+EJZm9fwwZZhFSptLc21z1sQbSfbw8PxVKnpCm6f61YlyiHD+2PbHU4NUIvtYiVnr/wAdO0pbvxdWvNNnhEd523tb2x1+OlCLvCglRVnpeLbqPnncl/Cji4riZzOZUdOVl58CtJW0J4q/afhpyIK2jEDWyMc2NACRGPYxikEAAEAACAAOQ0UQDEAAByAS4AeQIKAyAAAAF3ZsLv1/QpGls+NrLxHAXZyfArYSpapbxuvr9B+MqqCst7M2nVtJPwaf9Sg6NPyJXIhiT+AwSraxRvdl2syklqAXaUrx5aDejVXJiJa28ObG0Ja2fErUXlxUfNoA+pNiybw9KUt7pwk+cld/Nmdt7GqjKpXn3cNhpS5yqScsi831MF/EjQ2JK+Hofuqb/lSR5t7X9uZaM6Mf+Ws7/koQpp/z5H6MqUw8ZxVRzm3J3bd23vb4tka1dluWr/oNrTsr/AnwlO0dd71ZmoyoyrNk+InrZFVsARhBCNiZhAsmMbBsQUgAKIAAAAAgCiCAAAAAAAA//9k='), // Replace with your asset image
            ),
            SizedBox(height: 10),
            // Name and Date Joined
            Text(
              "Hi, Precious",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Joined Aug, 2022",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            // Quote of the Day
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.purple.shade50,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Text(
                      "Quote of the day",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "The time we spend awake is precious, but so is the time we spend asleep.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "LEBRON JAMES",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Zen Master Stats
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.purple.shade100,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "ZEN MASTER",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: LinearProgressIndicator(
                            value: 220 / 300,
                            color: Colors.purple,
                            backgroundColor: Colors.purple.shade100,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text("220/300"),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text("Level 8", style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Stats, History, Edit
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple.shade100,
                    foregroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text("STATS"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple.shade100,
                    foregroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text("HISTORY"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple.shade100,
                    foregroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text("EDIT"),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Additional Stats
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  statCard("23", "Completed Sessions"),
                  statCard("94", "Minutes Spent"),
                  statCard("15", "Longest Streak"),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Share My Stats Button
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.share),
              label: Text("Share My Stats"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // You can set this dynamically
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'You',
          ),
        ],
      ),
    );
  }

  Widget statCard(String value, String description) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

