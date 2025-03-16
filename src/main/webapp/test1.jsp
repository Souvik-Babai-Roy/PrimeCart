<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        .sidebar {
            height: 100vh;
            background-color: #343a40;
        }
        .sidebar a {
            color: white;
        }
        .card {
            margin: 15px 0;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar Navigation -->
        <nav class="col-md-2 d-none d-md-block bg-dark sidebar">
            <div class="sidebar-sticky">
                <h4 class="text-white text-center mt-3">Dashboard</h4>
                <ul class="nav flex-column">
                    <li class="nav-item"><a class="nav-link text-white" href="#overview">Overview</a></li>
                    <li class="nav-item"><a class="nav-link text-white" href="#sales">Sales</a></li>
                    <li class="nav-item"><a class="nav-link text-white" href="#customers">Customers</a></li>
                    <li class="nav-item"><a class="nav-link text-white" href="#inventory">Inventory</a></li>
                    <li class="nav-item"><a class="nav-link text-white" href="#marketing">Marketing</a></li>
                </ul>
            </div>
        </nav>

        <!-- Main Content -->
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
            <h1 class="h2 my-4">E-commerce Admin Dashboard</h1>

            <!-- Dashboard Overview -->
            <section id="overview" class="my-4">
                <h2>Overview</h2>
                <div class="row">
                    <div class="col-md-3">
                        <div class="card bg-primary text-white">
                            <div class="card-body">
                                <h5 class="card-title">Total Sales</h5>
                                <p class="card-text">$120,000</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card bg-success text-white">
                            <div class="card-body">
                                <h5 class="card-title">Revenue</h5>
                                <p class="card-text">$85,000</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card bg-warning text-white">
                            <div class="card-body">
                                <h5 class="card-title">Profit Margin</h5>
                                <p class="card-text">20%</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card bg-info text-white">
                            <div class="card-body">
                                <h5 class="card-title">Conversion Rate</h5>
                                <p class="card-text">3.5%</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Sales Dashboard -->
            <section id="sales" class="my-4">
                <h2>Sales Dashboard</h2>
                <div class="row">
                    <div class="col-md-6">
                        <canvas id="salesTrendsChart"></canvas>
                    </div>
                    <div class="col-md-6">
                        <canvas id="salesCategoryChart"></canvas>
                    </div>
                </div>
            </section>

            <!-- Customer Dashboard -->
            <section id="customers" class="my-4">
                <h2>Customer Dashboard</h2>
                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Total Customers</h5>
                                <p class="card-text">5,000</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <canvas id="customerSegmentChart"></canvas>
                    </div>
                </div>
            </section>

            <!-- Inventory Dashboard -->
            <section id="inventory" class="my-4">
                <h2>Inventory Dashboard</h2>
                <div class="row">
                    <div class="col-md-6">
                        <canvas id="stockLevelsChart"></canvas>
                    </div>
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Out-of-Stock Items</h5>
                                <p class="card-text">15 items</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Marketing Dashboard -->
            <section id="marketing" class="my-4">
                <h2>Marketing Dashboard</h2>
                <div class="row">
                    <div class="col-md-6">
                        <canvas id="websiteTrafficChart"></canvas>
                    </div>
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Social Media Growth</h5>
                                <p class="card-text">+2,000 followers this month</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
    </div>
</div>

<!-- JavaScript for Charts -->
<script>
    // Sales Trends Chart
    var ctx = document.getElementById('salesTrendsChart').getContext('2d');
    var salesTrendsChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May'],
            datasets: [{
                label: 'Sales Trends',
                data: [12000, 15000, 14000, 16000, 17000],
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 2,
                fill: false
            }]
        }
    });

    // Sales by Category Chart
    var ctx2 = document.getElementById('salesCategoryChart').getContext('2d');
    var salesCategoryChart = new Chart(ctx2, {
        type: 'doughnut',
        data: {
            labels: ['Electronics', 'Fashion', 'Home & Garden'],
            datasets: [{
                data: [5000, 8000, 4000],
                backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56']
            }]
        }
    });

    // Customer Segmentation Chart
    var ctx3 = document.getElementById('customerSegmentChart').getContext('2d');
    var customerSegmentChart = new Chart(ctx3, {
        type: 'pie',
        data: {
            labels: ['New', 'Returning'],
            datasets: [{
                data: [3000, 2000],
                backgroundColor: ['#FF6384', '#36A2EB']
            }]
        }
    });

    // Stock Levels Chart
    var ctx4 = document.getElementById('stockLevelsChart').getContext('2d');
    var stockLevelsChart = new Chart(ctx4, {
        type: 'bar',
        data: {
            labels: ['Product A', 'Product B', 'Product C', 'Product D'],
            datasets: [{
                label: 'Stock Levels',
                data: [20, 35, 15, 50],
                backgroundColor: '#36A2EB'
            }]
        }
    });

    // Website Traffic Chart
    var ctx5 = document.getElementById('websiteTrafficChart').getContext('2d');
    var websiteTrafficChart = new Chart(ctx5, {
        type: 'line',
        data: {
            labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
            datasets: [{
                label: 'Website Traffic',
                data: [200, 300, 250, 400, 450, 300, 500],
                borderColor: '#FF6384',
                borderWidth: 2,
                fill: false
            }]
        }
    });
</script>

</body>
</html>
