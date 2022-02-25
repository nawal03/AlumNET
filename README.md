<div align="center">

<h2 align="center">Squirrel</h3>

</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

AlumNet is a social networking platform for alumni of BUET. Here, current and ex students of BUET can connect with each other, write blog, post job post, add merchandise, 
create groups and events.

### Built With

This section should list any major frameworks/libraries used to bootstrap your project. Leave any add-ons/plugins for the acknowledgements section. Here are a few examples.

- Nodejs
- EJS
- Bootstrap
- OracleDB

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

Follow the step by step installation procedure to install and run this on your machine

### Prerequisites

Make sure you have node and oracle installed in your device.

**`NodeJs`**: Install Nodejs from [here](https://nodejs.org/en/download/)

**`Oracle`**:Install Oracle from [here](http://www.oracle.com/index.html) and register for an account of your own



### Installation

#### Getting the repository

1. Clone the repo
   ```sh
   git clone https://github.com/nawal03/AlumNET.git
   ```

2. If you don't have git installed in your device then download zip

3. After installation or download go to the repository and open command line.

4. Install NPM packages

   ```sh
   npm install
   ```



#### Setting up the database

1. Go to sql plus

2. Enter credentials

   ```sh
   username: sys as sysdba
   password: password
   ```

3.  Create a new user c##alumnet

   ```sh
   create user c##alumnet identified by password;
   grant dba to c##alumnet;
   ```

   

4. Find file dump.sql in `sql/SQL_DUMP.sql`

5. Head over to your favourite database GUI and connect squirrel with that

6. Import data from sql file depending upon the GUI. 

7. The DUMP should work i hope 😩

8. If no errors are shown we are good to go!



#### Setting up the environment variables

create a new file `.env` in the root directory. And the file should have the followings

```sh
DB_USER= YOUR_DB_USER 
DB_PASS= YOUR_DB_PASS
DB_CONNECTSTRING=localhost/orcl
PORT=YOUR_FABOURITE_PORT
APP_SECRET=YOUR_DARKEST_SECRET
```

If you followed the above then the `.env` should look like this

```sh
DB_USER= c##squirrel 
DB_PASS= password
DB_CONNECTSTRING=localhost/orcl
PORT= 3000
APP_SECRET=iLoveSquirrel
```


#### Run the project

Go to your favourite code editor and run

```sh
npm run dev
```

You should find that the project is working!

<p align="right">(<a href="#top">back to top</a>)</p>




<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTACT -->
## Contributors

- **Noshin Nawal** - 1805061

- **Maneesha Rani Saha** - 1805076

  

## Supervisor

- Dr. Rifat Shahriyar (রিফাত শাহরিয়ার)

  - **Professor**

    ▶ **Contact:**

    Department of Computer Science and Engineering
    Bangladesh University of Engineering and Technology
    Dhaka-1000, Bangladesh

    ▶   **Homepage:**

    [http://rifatshahriyar.github.io/](http://rifatshahriyar.github.io/)

<p align="right">(<a href="#top">back to top</a>)</p>


<p align="right">(<a href="#top">back to top</a>)</p>