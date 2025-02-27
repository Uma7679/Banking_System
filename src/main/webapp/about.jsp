<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>About Us - ABC Bank</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f4f7f6;
    }

    header {
      background-color: #0056b3;
      color: white;
      text-align: center;
      padding: 20px 0;
    }

    .container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 40px;
    }

    h2 {
      text-align: center;
      color: #0056b3;
      margin-bottom: 40px;
    }

    .content {
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    .about-section {
      background-color: white;
      padding: 30px;
      border-radius: 15px;
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
      width: 80%;
      margin-bottom: 40px;
    }

    .about-section h3 {
      color: #0056b3;
      margin-bottom: 15px;
    }

    .about-section p {
      color: #333;
      line-height: 1.6;
    }

    .values-list {
      list-style-type: none;
      padding: 0;
    }

    .values-list li {
      margin-bottom: 10px;
      padding-left: 20px;
      position: relative;
    }

    .values-list li:before {
      content: '✓';
      color: #0056b3;
      font-size: 18px;
      position: absolute;
      left: 0;
      top: 0;
    }

    footer {
      text-align: center;
      padding: 20px;
      background-color: #0056b3;
      color: white;
      margin-top: 40px;
    }

    .contact-section {
      text-align: center;
    }

    .contact-section p {
      font-size: 18px;
    }

    .btn {
      display: inline-block;
      padding: 10px 20px;
      background-color: #007bff;
      color: white;
      text-decoration: none;
      border-radius: 5px;
      transition: background-color 0.3s ease;
    }

    .btn:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>

<!-- Header -->
<header>
  <h1>About SBI Bank</h1>
</header>

<!-- About Us Content -->
<div class="container">
  <div class="content">
    <!-- Introduction -->
    <div class="about-section">
      <h3>Who We Are</h3>
      <p>ABC Bank is a leading financial institution committed to delivering innovative banking solutions tailored to meet the diverse needs of individuals and businesses. Established in 1990, we have consistently evolved to provide the latest in banking technology, with a focus on customer satisfaction and integrity.</p>
    </div>

    <!-- Mission and Values -->
    <div class="about-section">
      <h3>Our Mission</h3>
      <p>Our mission is to empower our customers by providing exceptional financial services, fostering growth, and contributing to the communities we serve. We strive to be the most trusted partner in your financial journey.</p>

      <h3>Our Values</h3>
      <ul class="values-list">
        <li>Integrity and transparency in all our dealings</li>
        <li>Customer-centric approach with personalized services</li>
        <li>Innovation and efficiency in banking operations</li>
        <li>Commitment to social responsibility and sustainability</li>
      </ul>
    </div>

    <!-- History -->
    <div class="about-section">
      <h3>Our History</h3>
      <p>From our humble beginnings as a regional bank in 1990, ABC Bank has grown into a nationwide financial leader with over 200 branches across the country. Over the years, we have expanded our portfolio to include a wide range of services such as personal banking, corporate banking, loans, investment solutions, and digital banking.</p>
    </div>

    <!-- Contact Us Section -->
    <div class="about-section contact-section">
      <h3>Contact Us</h3>
      <p>If you have any questions or would like more information about our services, feel free to reach out to us. Our dedicated team is here to assist you.</p>
      <a href="contact.jsp" class="btn">Contact Us</a>
    </div>
  </div>
</div>

<!-- Footer -->
<footer>
  <p>&copy; 2024 ABC Bank. All Rights Reserved.</p>
</footer>

</body>
</html>
