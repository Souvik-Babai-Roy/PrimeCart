<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PrimeCart Admin Dashboard</title>

    <!-- Fonts and Stylesheets -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lato:100,300,400,700,900&display=swap">
    <link href="Styles/adminlte.min.css" rel="stylesheet" type="text/css" />
    <link href="Styles/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />
</head>
<body class="hold-transition sidebar-mini layout-fixed">
    <div class="wrapper">
        
        <!-- Sidebar and Navbar (similar to previous template) -->
        
        <!-- Content Wrapper -->
        <div class="content-wrapper">
            <section class="content-header">
                <div class="container-fluid">
                    <h1>Dashboard</h1>
                </div>
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="container-fluid">

                    <!-- Core Metrics - Sales -->
                    <div class="row">
                        <!-- Total Revenue -->
                        <div class="col-lg-3 col-6">
                            <div class="small-box bg-info">
                                <div class="inner">
                                    <h3>$125,000</h3>
                                    <p>Total Revenue</p>
                                </div>
                                <div class="icon"><i class="fas fa-dollar-sign"></i></div>
                            </div>
                        </div>
                        <!-- Number of Orders -->
                        <div class="col-lg-3 col-6">
                            <div class="small-box bg-success">
                                <div class="inner">
                                    <h3>1,200</h3>
                                    <p>Number of Orders</p>
                                </div>
                                <div class="icon"><i class="fas fa-shopping-cart"></i></div>
                            </div>
                        </div>
                        <!-- Average Order Value -->
                        <div class="col-lg-3 col-6">
                            <div class="small-box bg-warning">
                                <div class="inner">
                                    <h3>$104</h3>
                                    <p>Average Order Value (AOV)</p>
                                </div>
                                <div class="icon"><i class="fas fa-chart-line"></i></div>
                            </div>
                        </div>
                        <!-- Conversion Rate -->
                        <div class="col-lg-3 col-6">
                            <div class="small-box bg-danger">
                                <div class="inner">
                                    <h3>3.8%</h3>
                                    <p>Conversion Rate</p>
                                </div>
                                <div class="icon"><i class="fas fa-percentage"></i></div>
                            </div>
                        </div>
                    </div>

                    <!-- Core Metrics - Customers -->
                    <div class="row">
                        <!-- Total Customers -->
                        <div class="col-lg-3 col-6">
                            <div class="small-box bg-primary">
                                <div class="inner">
                                    <h3>5,600</h3>
                                    <p>Total Customers</p>
                                </div>
                                <div class="icon"><i class="fas fa-users"></i></div>
                            </div>
                        </div>
                        <!-- New vs. Returning Customers -->
                        <div class="col-lg-3 col-6">
                            <div class="small-box bg-secondary">
                                <div class="inner">
                                    <h3>65%</h3>
                                    <p>Returning Customers</p>
                                </div>
                                <div class="icon"><i class="fas fa-user-check"></i></div>
                            </div>
                        </div>
                        <!-- Customer Acquisition Cost (CAC) -->
                        <div class="col-lg-3 col-6">
                            <div class="small-box bg-light">
                                <div class="inner">
                                    <h3>$20</h3>
                                    <p>Customer Acquisition Cost (CAC)</p>
                                </div>
                                <div class="icon"><i class="fas fa-money-bill-wave"></i></div>
                            </div>
                        </div>
                        <!-- Customer Lifetime Value (CLTV) -->
                        <div class="col-lg-3 col-6">
                            <div class="small-box bg-dark">
                                <div class="inner">
                                    <h3>$480</h3>
                                    <p>Customer Lifetime Value (CLTV)</p>
                                </div>
                                <div class="icon"><i class="fas fa-user"></i></div>
                            </div>
                        </div>
                    </div>

                    <!-- Sales and Revenue Charts -->
                    <div class="row">
                        <!-- Sales Trends Chart -->
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title"><i class="fas fa-chart-line mr-1"></i> Sales Trends</h3>
                                </div>
                                <div class="card-body">
                                    <div class="chart">
                                        <canvas id="salesTrendsChart" style="height: 250px;"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Customer Acquisition Cost Trends Chart -->
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title"><i class="fas fa-chart-pie mr-1"></i> CAC Trends</h3>
                                </div>
                                <div class="card-body">
                                    <div class="chart">
                                        <canvas id="cacTrendsChart" style="height: 250px;"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Advanced Metrics - Operational Efficiency -->
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="info-box bg-info">
                                <span class="info-box-icon"><i class="fas fa-truck"></i></span>
                                <div class="info-box-content">
                                    <span class="info-box-text">Order Fulfillment Time</span>
                                    <span class="info-box-number">24 hrs</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="info-box bg-warning">
                                <span class="info-box-icon"><i class="fas fa-redo"></i></span>
                                <div class="info-box-content">
                                    <span class="info-box-text">Return Rate</span>
                                    <span class="info-box-number">5%</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="info-box bg-danger">
                                <span class="info-box-icon"><i class="fas fa-percentage"></i></span>
                                <div class="info-box-content">
                                    <span class="info-box-text">Net Profit Margin</span>
                                    <span class="info-box-number">15%</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Marketing Metrics - Website Traffic -->
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title"><i class="fas fa-chart-bar mr-1"></i> Website Traffic</h3>
                                </div>
                                <div class="card-body">
                                    <div class="chart">
                                        <canvas id="trafficChart" style="height: 250px;"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title"><i class="fas fa-chart-pie mr-1"></i> Social Media Engagement</h3>
                                </div>
                                <div class="card-body">
                                    <div class="chart">
                                        <canvas id="socialEngagementChart" style="height: 250px;"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Fraud Prevention Metrics -->
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="info-box bg-warning">
                                <span class="info-box-icon"><i class="fas fa-exclamation-circle"></i></span>
                                <div class="info-box-content">
                                    <span class="info-box-text">Fraudulent Order Attempts</span>
                                    <span class="info-box-number">12</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="info-box bg-danger">
                                <span class="info-box-icon"><i class="fas fa-shield-alt"></i></span>
                                <div class="info-box-content">
                                    <span class="info-box-text">Chargeback Rate</span>
                                    <span class="info-box-number">1.2%</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>

<!-- Main Content Wrapper -->
<div class="content-wrapper">
    <section class="content-header">
        <div class="container-fluid">
            <h1>PrimeCart Admin Dashboard</h1>
            <p>Comprehensive insights into your e-commerce performance</p>
        </div>
    </section>

    <section class="content">
        <div class="container-fluid">
            
            <!-- Core Metrics - Sales Overview -->
            <div class="row">
                <!-- Total Revenue -->
                <div class="col-lg-3 col-6">
                    <div class="small-box bg-info">
                        <div class="inner">
                            <h3>$125,000</h3>
                            <p>Total Revenue</p>
                        </div>
                        <div class="icon"><i class="fas fa-dollar-sign"></i></div>
                    </div>
                </div>
                <!-- Number of Orders -->
                <div class="col-lg-3 col-6">
                    <div class="small-box bg-success">
                        <div class="inner">
                            <h3>1,200</h3>
                            <p>Total Orders</p>
                        </div>
                        <div class="icon"><i class="fas fa-shopping-cart"></i></div>
                    </div>
                </div>
                <!-- Average Order Value -->
                <div class="col-lg-3 col-6">
                    <div class="small-box bg-warning">
                        <div class="inner">
                            <h3>$104</h3>
                            <p>Average Order Value (AOV)</p>
                        </div>
                        <div class="icon"><i class="fas fa-chart-line"></i></div>
                    </div>
                </div>
                <!-- Conversion Rate -->
                <div class="col-lg-3 col-6">
                    <div class="small-box bg-danger">
                        <div class="inner">
                            <h3>3.8%</h3>
                            <p>Conversion Rate</p>
                        </div>
                        <div class="icon"><i class="fas fa-percentage"></i></div>
                    </div>
                </div>
            </div>

            <!-- Advanced Sales Metrics - Revenue by Product and Segment -->
            <div class="row">
                <!-- Revenue by Product Category -->
                <div class="col-lg-6">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title"><i class="fas fa-pie-chart mr-1"></i> Revenue by Product Category</h3>
                        </div>
                        <div class="card-body">
                            <div class="chart">
                                <canvas id="revenueByCategoryChart" style="height: 250px;"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Revenue by Customer Segment -->
                <div class="col-lg-6">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title"><i class="fas fa-chart-bar mr-1"></i> Revenue by Customer Segment</h3>
                        </div>
                        <div class="card-body">
                            <div class="chart">
                                <canvas id="revenueBySegmentChart" style="height: 250px;"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Core Metrics - Customers -->
            <div class="row">
                <!-- Total Customers -->
                <div class="col-lg-3 col-6">
                    <div class="small-box bg-primary">
                        <div class="inner">
                            <h3>5,600</h3>
                            <p>Total Customers</p>
                        </div>
                        <div class="icon"><i class="fas fa-users"></i></div>
                    </div>
                </div>
                <!-- Customer Acquisition Cost -->
                <div class="col-lg-3 col-6">
                    <div class="small-box bg-secondary">
                        <div class="inner">
                            <h3>$20</h3>
                            <p>Customer Acquisition Cost (CAC)</p>
                        </div>
                        <div class="icon"><i class="fas fa-money-bill-wave"></i></div>
                    </div>
                </div>
                <!-- Customer Lifetime Value -->
                <div class="col-lg-3 col-6">
                    <div class="small-box bg-dark">
                        <div class="inner">
                            <h3>$480</h3>
                            <p>Customer Lifetime Value (CLTV)</p>
                        </div>
                        <div class="icon"><i class="fas fa-user"></i></div>
                    </div>
                </div>
                <!-- Customer Churn Rate -->
                <div class="col-lg-3 col-6">
                    <div class="small-box bg-danger">
                        <div class="inner">
                            <h3>5%</h3>
                            <p>Customer Churn Rate</p>
                        </div>
                        <div class="icon"><i class="fas fa-user-times"></i></div>
                    </div>
                </div>
            </div>

            <!-- Inventory Metrics -->
            <div class="row">
                <!-- Stock Levels -->
                <div class="col-lg-3 col-6">
                    <div class="small-box bg-warning">
                        <div class="inner">
                            <h3>1,500</h3>
                            <p>Stock Levels</p>
                        </div>
                        <div class="icon"><i class="fas fa-box"></i></div>
                    </div>
                </div>
                <!-- Out-of-stock Items -->
                <div class="col-lg-3 col-6">
                    <div class="small-box bg-danger">
                        <div class="inner">
                            <h3>25</h3>
                            <p>Out-of-stock Items</p>
                        </div>
                        <div class="icon"><i class="fas fa-exclamation-triangle"></i></div>
                    </div>
                </div>
                <!-- Inventory Accuracy -->
                <div class="col-lg-3 col-6">
                    <div class="small-box bg-info">
                        <div class="inner">
                            <h3>98%</h3>
                            <p>Inventory Accuracy</p>
                        </div>
                        <div class="icon"><i class="fas fa-clipboard-check"></i></div>
                    </div>
                </div>
                <!-- Stock Turnover Rate -->
                <div class="col-lg-3 col-6">
                    <div class="small-box bg-success">
                        <div class="inner">
                            <h3>4.5</h3>
                            <p>Stock Turnover Rate</p>
                        </div>
                        <div class="icon"><i class="fas fa-sync-alt"></i></div>
                    </div>
                </div>
            </div>

            <!-- Marketing and Customer Satisfaction -->
            <div class="row">
                <!-- Website Traffic -->
                <div class="col-lg-6">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title"><i class="fas fa-chart-line mr-1"></i> Website Traffic</h3>
                        </div>
                        <div class="card-body">
                            <canvas id="trafficChart" style="height: 250px;"></canvas>
                        </div>
                    </div>
                </div>
                <!-- Customer Satisfaction - NPS -->
                <div class="col-lg-6">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title"><i class="fas fa-smile mr-1"></i> Net Promoter Score (NPS)</h3>
                        </div>
                        <div class="card-body">
                            <canvas id="npsChart" style="height: 250px;"></canvas>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>
</div>

    <!-- Scripts for Charts and Real-Time Widgets -->
    <script src="Scripts/Chart.min.js"></script>
    <script src="Scripts/admin-dashboard.js"></script> <!-- Add chart rendering scripts in this file -->
    <script>
 // salesTrendsChart
    const salesTrendsCtx = document.getElementById('salesTrendsChart').getContext('2d');
    new Chart(salesTrendsCtx, {
        type: 'line',
        data: {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May'],
            datasets: [{ data: [12000, 15000, 8000, 18000, 14000], label: "Sales", borderColor: "#3e95cd" }]
        }
    });

 // Sample configurations using Chart.js for each chart
 // Ensure Chart.js is loaded in your project

 // Revenue by Product Category - Pie Chart
 const revenueByCategoryCtx = document.getElementById('revenueByCategoryChart').getContext('2d');
 new Chart(revenueByCategoryCtx, {
     type: 'pie',
     data: {
         labels: ['Electronics', 'Fashion', 'Home & Garden', 'Health', 'Toys'],
         datasets: [{
             data: [30000, 20000, 15000, 10000, 5000],
             backgroundColor: ['#007bff', '#dc3545', '#ffc107', '#28a745', '#6c757d']
         }]
     }
 });

 // Revenue by Customer Segment - Bar Chart
 const revenueBySegmentCtx = document.getElementById('revenueBySegmentChart').getContext('2d');
 new Chart(revenueBySegmentCtx, {
     type: 'bar',
     data: {
         labels: ['New', 'Returning', 'VIP'],
         datasets: [{
             label: 'Revenue by Segment',
             data: [45000, 70000, 20000],
             backgroundColor: ['#007bff', '#dc3545', '#ffc107']
         }]
     },
     options: {
         scales: { y: { beginAtZero: true } }
     }
 });

 // Website Traffic - Line Chart
 const trafficCtx = document.getElementById('trafficChart').getContext('2d');
 new Chart(trafficCtx, {
     type: 'line',
     data: {
         labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'],
         datasets: [{
             label: 'Website Traffic',
             data: [1200, 1900, 3000, 5000, 2000, 3000, 4000],
             borderColor: '#007bff',
             fill: false
         }]
     },
     options: { responsive: true }
 });

 // Net Promoter Score (NPS) - Doughnut Chart
 const npsCtx = document.getElementById('npsChart').getContext('2d');
 new Chart(npsCtx, {
     type: 'doughnut',
     data: {
         labels: ['Promoters', 'Passives', 'Detractors'],
         datasets: [{
             data: [60, 25, 15],
             backgroundColor: ['#28a745', '#ffc107', '#dc3545']
         }]
     },
     options: { responsive: true }
 });

    // Add similar configurations for other charts

    </script>
</body>
</html>
