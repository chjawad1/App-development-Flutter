import 'package:flutter/material.dart';

void main() {
  runApp(const ProfileApp());
}

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Gradient background
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF00AEEF),  // Light blue
              Colors.white,        // White
            ],
          ),
        ),
        child: Column(
          children: [
            // AppBar Replacement - Top Section with Icons
            Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 16.0, right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.menu, color: Colors.white),
                  Icon(Icons.notifications, color: Colors.white),
                  Icon(Icons.shopping_cart, color: Colors.white),
                ],
              ),
            ),

            // Profile Picture Section
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxASEhUQEhIVFhUVFRYWFxcXFRUWFRUVFxUWFhUXFRcYHSggGBomHRUVITEhJSkrLy4vFx8zODMtNygtLisBCgoKDg0NGBAQFy0dHSUtLi0tLSstKy0tLS0tLS0tLS0tLSsrLS0tKy0tLS0tLS0tLSstLS0tLSstKy0tLSstLf/AABEIAOEA4QMBIgACEQEDEQH/xAAbAAACAwEBAQAAAAAAAAAAAAAAAQIDBAUGB//EAD0QAAEDAQUFBgQEBQMFAAAAAAEAAhEDBBIhMUEFUWFxgQYikaGx8BMywdFCcuHxBxQjYtJSgpIVM7LC4v/EABkBAQEBAQEBAAAAAAAAAAAAAAABAgMEBf/EACQRAQEAAgICAgICAwAAAAAAAAABAhEDIRIxQVEEMnGREyJC/9oADAMBAAIRAxEAPwD48knCAoAJoCaATQhA1AuGpw9+KrrVNAqSqNTbQ0ZTzKXxWTN0k9FnSKDYy1yYazz/AEWuYzcPQLkDgm3BF20VrQ8HBwj+2IWqx1y4YuErNRtt38I6SPutdN9N+MQeMA/qgvk7lRWtAGMGdRvHBXtGh8d6sbZDU7oE4Exy3KNa2jSqhwkIc8DMrmFzqTiB4HitDBdF5xlxzOvIJpNtbKhJwBUK1AOxyO/fzVVOsXZQAtFJxGIJnfki+2J9JzfmaRxgweRUIXU+NW/DUjfJcQef7KVpsVRzb5Y063ma/mEDxjqoeH05BCFJKFWCSTQgSSkkgihNCCKaSkgE0gmgFRVq7lKq6ZGgzP0WYlUOUAqKYQTQApspEi8cAcideWp6KXdGk88PIfdBUUoKuvn9gB6Ksk6EoIgKymSMjCgSVdZ7pwOaCdOu4ctRp+i7OzrUA5rxoceRzVNlptPdAE5aYqutY30pqNktHztPzN3GNRxRubnaO2A0VnuH+qBz185WZ9MkAnN3kFOoQWhx4HmT+6dnBPeOuXJEt3Wmz0wB7wVqzPqMb82J3D6qNJ17MEDgJPj+ilix0KDmg95pI4GCvQWFtMCGE7yDmOhyXm6DKX4g/wD2zK1F7QB8OoTGQODhyIw6LNjrhlpHtDs+6fitGDj3hudoevrzXGXbp24vkPdLXC6csNx5grj1qd0kHQkdQYKsc+TW9xXCiVJIquZJKUJIIwhNCCKaQUkAo1HQJTVFerOAQQe/CB14lVwmkqGB1Vshu5zvFrf8j5c1EGOZ8hu5qCCw1STJJJ3lAcq1MMQSVjKROQRSDBmCfRWvtE4DAeZ+yCkiMPRdvZ9Ku2mSWNuxP9SD5DFcmnaA38IjdkOup8lrPaOvoGf8T/kpW8bJ7Za9qJMtAb+UQPBeo2LtBtdl18XwC0z+IfruXlq9u+IZe0Xt4EeO9SsFaCeU+B/UJZtcc9VG2Nun4f8Aoc5v/EkDyWqjTcQPwtA6kcNyoqvms5xF4kiBvMDEq5he98HJpkxlIxA4lVlopUGjID6+O9XKL3hokmAs/wD1Cn/ceQH1IUVqCutU3W3gJImT8wE4Gd2eay2fajAZbRc7iTI8AI81fXtJqG+RB3eyo1uac2s803XvwnP781ZaDJPEAjwg+itc0GWnwKoeYu8MOnuQqxVSSk4RgkoySRTQUEYQhNBAJpBKo6BKorrv0VEIJSVApMGu710UQp6HmPRyCBTDUNarEAAmkovcqJEoJUWiMFF7pQDnSooaJwWh9iqDG7PLFRdWs8q5j4x4ec/oqQCdFdRoOdg0E++KEjTRtAbpicyPQKz+fgQGgdZWSrRczBwj3p4quSh6b6ANQyQOoy97sFf/AC1Nnedjzy6NXOZVcMA4+MLVZwwG89wLuphCNtBxOMQNBwUnBZaj2nKrHDCPBVGnVGIcXDgfoVGttdUy0xg4Yjn9Qs3xQ8B2owI5/ss1Su+cXGRwgjfIVVJ0H373K6Ztbn5+HoopzlyHoEllCQmUkChCaEEFRaTkr1RadFRQhCFUNSp44b/YUFJphFTdgqxiUnOJTZlKomXKtuablfXo3IbrEnmdOkeqLIpcc/BW2WxPecBhv+yt2ZZr7oOQxPiAvRU2ACAsZZadePi8u6x2XZzW+8VsDQFJOFyt29Mxk9KH2ZhIdGIyOqlTotaLoED35q1CbWSObtVt6jOrXD1un1lcUNwJ3GDwnI+q7u0jFOoOP+P1K5myqN8VBwH/ALLrj6ebkm8mK8mUgw3b0YTHWJSDlpwXi4RqD4+X2QyoWnuu8MuoKqCtbTB/EOoIPlggvdVFTAgB2h0PBZIxjVXizs1qDpipURec6JLQJJOZyaJ5kjpKKnRyHJTQhZQkimkUCQkmgSqqslWpOVGApoecTzQqgCChJAKcacU7NTvOASmTKq6TouAcHHIY84xA8YXSsNlLnF1TPAxwM+GSy7LYC+SMo8SQPqu2cKn5mf8Aif8A6WMq78ePzXL2a6KztxLh0LsPOB1XcXHqUw0h+l4sfwD+8D0Ll1KTz8rsx5jeFjL7dOO66WhNCFh2CRKZWa21gxsnkAM54cVYlunM21X7obq43j+UfKPr0V+wKUMLt5PhkPQ+K41SrffedkTpoBkAuvZ9rUWgN70b4w9ZXSzrTzY5S57pWOyh1F9PUPd0IiCuI5pBg5jArs2C1M+JUIdg4gicJnPPUFZdsULr5GR9/ZWe0zkuMsYEw5WWWzuqODG6+Q1JXSs9hh4c35WvDZ1djDjynBW3Tnjha5i6bbraYY3N0OeeOjen1Kz2+z3KjmRAkHkHAOHkVY3f7G4Il63DQmkoySRTQioJpoQRSKaIVGBwxV1Snh0n7/ROvSOY5K9sOHvAqjCUlbVokHnkhrO759BgglY6hacBJIyVJkYRClTcWOB3EHou29rYIcARmORx99FLdOmOPlHKstpDXEnUEdcIPiF2P5+m+CHQ4GQDhOEEY8CfJch9MPP9Om4gHGJP7Kh4Zl3hwIB+ya2szuPT0tNjXNg4te0ekH6eCjQddIpPxP4CfxD/ACC4ljtb6eIN5uo3dNF6BhZVYJEg4wcx73rGU07YZeX8rRnHv39lVXtdNnzOA4a+CjVspIhrj1M+awDYgkkuJ+p4rMkayuU9ROrtxg+VpPPALnVLTUrujDdAyA1kq/8A6a8vDGNidTjzJG5T2jYa9ItaXzeBII7skZjDXJdJJPThlc77OjshoxfU6N+/6Lt7M2SxzmspUwS4wMJPiVyuzuzhaKgoupufUqVKTGOLjDG3iaziyO/3eIAxzwj6XsTsELLa3VA95pMaA2HuYS8gFxgZtggQXZzmufJlqe3o/Hw8r1iz1uyVKzPpV3C+AC2tuuZlzRvaSHfla/gvMfxM2Myg+m6nNx4wxkA8CvsdSmD6g6g7wvE/xO2awWO81rW3XA4AASSNByK8/HyXym3t5+Gf48tfy+Z7FLWU31HaEDoAPqV0qN11MvYRDRMciMOBxVmwrLZhYqzq5N4tPw24jEiA88oB9hV9iKUuhwll4PfuDGQ9xPO7HIFejK+68OGOvGfbF2mbNrqjcWNPNtNjT5tKyq201C976hEF7nPPAvcXEecdFUuk9PJnd5WhJNCMEkmkikhCEEQmEkwgZCQammECcJVTGxI0OI4HcrkKjNWo4csvsutstwfTE4xgen6LDC17IgOcBk7GNxGY9FnL068P7OnYKdOmSYMO6wd6w7W2Wx7y6m9sOMkA4h2uAzBXQQsTKx6csJZpgp2EBoLjLgA0ZwGCZEEazPvGdhp3XED5SJG4EZx5LYQgZ9D9E8tkwk9JIhCay2GGDIzVlaoXi64NI3Fs9VWp02kkACSchvKbXW3tOwljBbUqMZTpHBgfTZ/Uyl3eql8ZtwAAXsabIEZ8TEk5kmNScVzdhWT4FFlLN0S78xxd0GXQLqgLyZ5XKvfx4THELzXb8t/lCHRDnsz4S76L0q8P/E+3sY2z0nGLz3v/AODYE9XjwTjm8octkwu3ktjdmn26ofiVPhUWaCL53QDgDzy3Lrdp9oWWx0Ds6yAXiIquGN1pguDnfie7DDQbsF4637ZHy0jic3aDlvKxUGw2dXY/T7+K9swtu76fKz5scZZjO/tY5RTSXR4whCECSTSQJJNJAkwkmFQ00kKBoQhA06Juva/cceIyPqkgoS6ruEphU2J95gOowPMewVoXKvoS7myUC7vAf2u9WqazOM1QNzD5lv2SFawnC6HZvZnx67aZ+WC52+6PuSB1Xc7abGpUgyrSAaCbhaMpiQR4GeixcpLp1x47cfJ5QBet7FbFvu+O8d1p7vF2/ouFsfZzq9VtNuuZ3DUr6rZLO2mxtNghrRAXPlz11Hbhw+anTYArAkmvO9RFfHf4r1zUtJg92g1lOP7n99x8HUx0X1+tUa1pe4w1oJJ3ACSV8S29WNVlaq6ZeXVCDmCXXgOmA6L0fj/tt5fy7/pp5FgkrqH7eg+srlMOK6r4kxkTI/KcW+UL218VEoQhRkISKEAkmkikhCEEUIQiGmkmimhCEAmkmiVp2fWuug5O8jp9vBdVcEhdOwWm8Lrj3h5jfzWcp8vTw5/81sWWpReH/EbBwgg4SM89FpSc8DPyBJ8AsR6L2nZrS4YtLmO4GCOoWl1ao8i+9zzkLxLjjulYRWbPHiCD4Lvdk6lP44e+nVcG4i5SqPh34SQ0TCzl1Nt8fd1t7nstsYWenLh/UfBdw3NXcCx2HaNOrIbfBGYfTqU3Do9oK2SvHlu3t9GSSdApIWDbO1admpmo/k1oze7cPvopIW6m64nb3adykLM096r83CkD3p/Me7xF7cvm+1D/AEn/AJT6L02zrHVt1oc+oYnvPI/C3JrGeg6nHGcvbfYP8sxxaS6m9joJzDg0m6Y8R13L18esbMXh5rcpa+dWVkk8lrozEbtPss9jdBPJayF6q+SaEIUQkIQhoJIQikhCEEUKo1QkaxV0Lwms3xncExVPBNDShZ/ilP4x4JoXphUCvwUvjBBagEggjAjI7lSa/BVurFNDv2O1B43OGY+o4LSvNbPqkOMGDmPrK79mrhw3EZjd+i55Y6ezjz8p2k+1Xc2v6CfQr03ZjtpRosFI2ari4kvAGM5SCdBAXngvT9hrAypVc54BuAEA5STmuWevHt6uHy8uq+gWS0ioxtRoIDhIBEHqFeoBcvtF2goWOn8SoZJwYwfO924DdvOi8km7qPdbJN1ftzbFGy0jWqnDJrR8z3aNaNSf1XzC27Uq2moatXM4NYMW026NbvO86nose0NoVrVUNornESKbB8lJp0HHKT7Ha7F7M+LWDnDus7x4nQL044TCb+Xjy5LyZanp7bsxs34FEAjvv7zuZyHQJ9qbCK9lq09bpcODm4j6jququZ2g2tTs1F1R+OjW6vcRg0fU6CSuU3cum7qTv0+DWWzObVLXD5ZB6qwtgkbsuWn26La7EucfmcS53MnTgs9pb+Lx5e/VfQfHyk+FaSbWmJSRgJJpKAQhIoBCjKEGVCqLkloXpKsuU7wCBkwowTwUS9IlBaAEXgqUkFpekXKtSAz5fUKolSqXXB24/uuuCR3mnHTcRuPBcVdbZtSWQdPT39FnJ24r3pvs+0qbszdOodhB55Feh7N9pKdleXEtcxwgw5siMQQvHW6x3hebmPMLmUqRcboEn3mudwxyjtOfPjvp9d2h/E+ztEUKT6lQ4AGA2eJBJPILxdWrWr1DaLQ+9Ud4Mbo1g0HvEklY9nbPDMXYnyC6MrExxx/V2vJnyfv/AEcZAe/eC+n9l7B8CiAfmd3nczp0C8N2XsPxa7SR3W4nmMffRe/2jtOlZ2fEqugab3Hc0alcuS76jtxzU3Utu7UbZ6ReTByHPfGv7L5NtTaL677zySBIaCZugmT1JxJ5bgtHaLbj7VUvnusGDGTkN53uP6LkErtxcfj3fbyc/P5dT0ZKqqY93x4BDnzgPHck1unj71K7vKmCBgFRWbBnf6q/AKo1gcAL3TDxKClCs+GNSPHLqq3iNQeSmmSSQUKCKaEIjnJoQtgQShCAQhCAQhCAATDsZSQgk1kmBquhQAYcNAOuh+iw0Kt0ytrarDJvATvwhZrrhp04RQYASszLbTAEuHr6KJ2pTGUnp91jVd/PH7dMFNzoErjP2wfws8T9B91hr2t7/md0GA8E8Ey5sZ6e2snaqlZGEUwH1LsSZugnE4DF2QGnNeb2p2grV333kuOk6Dc1owAXIW2xWQzeIjdPrC1jhI5582WfV9NweQBezjHnwRBOeA3anmoVarWYk4+ZWCtaX1DdAMbh9Vpz23CsCbjNMzoBw3lWyBgPD7qmz0CBGQ1j5jzOnTxV4AA3IKn0pxecBpoFKm0ESMtP3WO0Xqj7mgxPDnxW4QBAGXkqG50KipTv6Rx1VgZjJz9FktdrM3GZ5SPQIJMo02kNLiXbpP0+q0FrRoPBZbLY47zjju+5WuIURHu/6fJClKSK4qEIVYCEIQCEIQCEIQCEJIGhCEAhCEAgBClRm8IznBFdShZmMxzO/jwVlUvPywOJz8FXfawS4yfM8lhtFqc/DIbhrzRUntpgy5xeeGXUq+y2xs3boaNIxVFKxE4uMDz/AEUjXazBgx3oNDbWb90iBki12iCA3E+X7rFTDnuxk+PsLoMs8OvbhA/dBKhRujHM4k8VbMI4+/Bc601SHyMx9dAorRarRBuCZI0jDAx5x0lOzUAwcdSlZaEC+75j5cFeiBJNJRUJTUfhhCDjhBTQtMEUIQoBCEKgQhCAQhCAQU0IEhCEApMzHNCEFlq+YqzZ3zHkhCK1W35SuYhCDqbO+Tx9VpdpzQhFFTTn9FzaX/c/3fUIQg6Qz6IchCiooQhQQQhCD//Z',
                    scale: 1.0),
              ),
            ),
            const Text(
              'Abdul Haseeb',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),

            // Grid Section
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: [
                    _buildGridCard('Science', Icons.science),
                    _buildGridCard('Mathematics', Icons.calculate),
                    _buildGridCard('English', Icons.language),
                    _buildGridCard('Logical Reasoning', Icons.psychology),
                    _buildGridCard('History', Icons.public),
                    _buildGridCard('Civics', Icons.account_balance),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.check), label: 'Tests'),
          BottomNavigationBarItem(icon: Icon(Icons.event_note), label: 'Activities'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Bookmarks'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
        ],
        selectedItemColor: const Color(0xFF00AEEF),  // Blue
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  // Helper function to create grid cards
  Widget _buildGridCard(String title, IconData icon) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: const Color(0xFF00AEEF)), // Blue color
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("25\nVideos",
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.center),
                Text("345\nGoals",
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.center),
                Text("322\nConcepts",
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.center),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
