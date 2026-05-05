<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= esc($title ?? 'Mygate PMS') ?></title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <style>
        :root {
            --mygate-black: #1D1E1E;
            --mygate-blue: #AEDFFB;
            --mygate-yellow: #FEDF2B;
            --blue-gradient: linear-gradient(135deg, #D2EFFA, #AEDFFB);
            --yellow-gradient: linear-gradient(135deg, #F3ED9D, #FEDF2B);
        }
        body { font-family: 'Inter', sans-serif; background-color: #f0f2f5; color: var(--mygate-black); }
        .sidebar { 
            position: fixed;
            top: 0;
            left: 0;
            bottom: 0;
            z-index: 100;
            padding: 48px 0 0; /* Height of navbar if any */
            box-shadow: 4px 0 10px rgba(0,0,0,0.1);
            background-color: var(--mygate-black);
            color: white;
            transition: all 0.3s;
            overflow-x: hidden;
            overflow-y: auto; /* Scrollable sidebar if content is long */
        }
        .sidebar .nav-link { color: rgba(255,255,255,0.7); font-weight: 500; transition: all 0.2s; padding: 0.8rem 1rem; }
        .sidebar .nav-link:hover { color: var(--mygate-yellow); background: rgba(255,255,255,0.05); }
        .sidebar .nav-link.active { color: var(--mygate-black); background: var(--yellow-gradient); border-radius: 8px; margin: 0 10px; }
        .navbar { background-color: white; border-bottom: 1px solid #eee; position: sticky; top: 0; z-index: 101; }
        .main-content { 
            margin-left: 16.666667%; 
            width: calc(100% - 16.666667%);
            padding: 2rem; 
            min-height: 100vh;
            overflow-x: hidden; /* Prevent global horizontal scroll */
        }
        .horizontal-scroll-section {
            overflow-x: auto;
            white-space: nowrap;
            padding-bottom: 1rem;
            display: flex;
            gap: 1rem;
        }
        .horizontal-scroll-section .card {
            flex: 0 0 300px; /* Fixed width for cards in horizontal scroll */
            white-space: normal;
        }
        .btn-primary { background: var(--blue-gradient); border: none; color: var(--mygate-black); font-weight: 600; }
        .btn-primary:hover { background: #9cd4f5; color: var(--mygate-black); transform: translateY(-1px); }
        .card { border-radius: 12px; border: none; transition: transform 0.2s; }
        .card:hover { transform: translateY(-2px); }
        .card-header { border-bottom: 1px solid #f0f0f0; }

        /* Custom Scrollbar */
        ::-webkit-scrollbar {
            width: 8px;
            height: 8px;
        }
        ::-webkit-scrollbar-track {
            background: #f1f1f1;
            border-radius: 10px;
        }
        ::-webkit-scrollbar-thumb {
            background: var(--mygate-black);
            border-radius: 10px;
            border: 2px solid #f1f1f1;
        }
        ::-webkit-scrollbar-thumb:hover {
            background: var(--mygate-blue);
        }

        /* For Horizontal Scroll Sections */
        .horizontal-scroll-section::-webkit-scrollbar {
            height: 6px;
        }
        .horizontal-scroll-section::-webkit-scrollbar-thumb {
            background: var(--mygate-blue);
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <nav class="sidebar py-3" style="width: 16.666667%;">
                <div class="position-sticky">
                    <div class="px-3 mb-4 text-center">
                        <img src="/assets/img/mygate-nobg-logo.webp" alt="Mygate PMS" class="img-fluid rounded shadow-sm" style="max-height: 40px;">
                    </div>
                    
                    <div class="nav flex-column px-2" id="sidebarMenu">
                        
                        <a class="nav-link mb-1" href="/admin/dashboard">
                            <i class="bi bi-speedometer2 me-2"></i> Dashboard
                        </a>

                        <!-- Properties Group -->
                        <div class="mb-1">
                            <button class="nav-link w-100 text-start d-flex justify-content-between align-items-center" type="button" data-bs-toggle="collapse" data-bs-target="#propCollapse">
                                <span><i class="bi bi-building me-2"></i> Properties</span>
                                <i class="bi bi-chevron-down small"></i>
                            </button>
                            <div class="collapse ps-3" id="propCollapse" data-bs-parent="#sidebarMenu">
                                <a class="nav-link py-1 small" href="/admin/landlord">Manage Landlords</a>
                                <a class="nav-link py-1 small" href="/admin/property">Manage Properties</a>
                                <a class="nav-link py-1 small" href="/admin/unit">Manage Units</a>
                            </div>
                        </div>

                        <!-- Applicants Group -->
                        <div class="mb-1">
                            <button class="nav-link w-100 text-start d-flex justify-content-between align-items-center" type="button" data-bs-toggle="collapse" data-bs-target="#appCollapse">
                                <span><i class="bi bi-people me-2"></i> Applicants</span>
                                <i class="bi bi-chevron-down small"></i>
                            </button>
                            <div class="collapse ps-3" id="appCollapse" data-bs-parent="#sidebarMenu">
                                <a class="nav-link py-1 small" href="/admin/application">Rental Application</a>
                                <a class="nav-link py-1 small" href="/admin/application/list">Applicant List</a>
                            </div>
                        </div>

                        <!-- Lease Group -->
                        <div class="mb-1">
                            <button class="nav-link w-100 text-start d-flex justify-content-between align-items-center" type="button" data-bs-toggle="collapse" data-bs-target="#leaseCollapse">
                                <span><i class="bi bi-file-earmark-text me-2"></i> Lease Management</span>
                                <i class="bi bi-chevron-down small"></i>
                            </button>
                            <div class="collapse ps-3" id="leaseCollapse" data-bs-parent="#sidebarMenu">
                                <a class="nav-link py-1 small" href="/admin/tenant">Tenant List</a>
                                <a class="nav-link py-1 small" href="/admin/lease">Lease List</a>
                                <a class="nav-link py-1 small" href="/admin/lease/weekly">Weekly Agreements</a>
                            </div>
                        </div>

                        <!-- Accounting Group -->
                        <div class="mb-1">
                            <button class="nav-link w-100 text-start d-flex justify-content-between align-items-center" type="button" data-bs-toggle="collapse" data-bs-target="#accCollapse">
                                <span><i class="bi bi-cash-stack me-2"></i> Accounting</span>
                                <i class="bi bi-chevron-down small"></i>
                            </button>
                            <div class="collapse ps-3" id="accCollapse" data-bs-parent="#sidebarMenu">
                                <a class="nav-link py-1 small" href="/admin/accounting/journal">Journal Entries</a>
                                <a class="nav-link py-1 small" href="/admin/accounting/receipts">Receipts</a>
                                <a class="nav-link py-1 small" href="/admin/accounting/vouchers">Debit Vouchers</a>
                                <a class="nav-link py-1 small" href="/admin/payment">Payment View</a>
                            </div>
                        </div>

                        <!-- Operations Group -->
                        <div class="mb-1">
                            <button class="nav-link w-100 text-start d-flex justify-content-between align-items-center" type="button" data-bs-toggle="collapse" data-bs-target="#opCollapse">
                                <span><i class="bi bi-gear me-2"></i> Operations</span>
                                <i class="bi bi-chevron-down small"></i>
                            </button>
                            <div class="collapse ps-3" id="opCollapse" data-bs-parent="#sidebarMenu">
                                <a class="nav-link py-1 small" href="/admin/workorder">Work Orders</a>
                                <a class="nav-link py-1 small" href="/admin/maintenance">Maintenance Log</a>
                                <a class="nav-link py-1 small" href="/admin/project">Projects</a>
                            </div>
                        </div>

                        <!-- Misc Group -->
                        <div class="mb-1">
                            <button class="nav-link w-100 text-start d-flex justify-content-between align-items-center" type="button" data-bs-toggle="collapse" data-bs-target="#miscCollapse">
                                <span><i class="bi bi-collection me-2"></i> Utilities</span>
                                <i class="bi bi-chevron-down small"></i>
                            </button>
                            <div class="collapse ps-3" id="miscCollapse" data-bs-parent="#sidebarMenu">
                                <a class="nav-link py-1 small" href="/admin/marketing">Marketing</a>
                                <a class="nav-link py-1 small" href="/admin/settings/pass_storer">Pass Storer (UPS)</a>
                                <a class="nav-link py-1 small" href="/admin/quicklink">Quick Links</a>
                            </div>
                        </div>

                        <!-- Reports Group -->
                        <div class="mb-1">
                            <button class="nav-link w-100 text-start d-flex justify-content-between align-items-center" type="button" data-bs-toggle="collapse" data-bs-target="#reportCollapse">
                                <span><i class="bi bi-graph-up me-2"></i> Reports</span>
                                <i class="bi bi-chevron-down small"></i>
                            </button>
                            <div class="collapse ps-3" id="reportCollapse" data-bs-parent="#sidebarMenu">
                                <a class="nav-link py-1 small" href="/admin/report/cashflow">Cashflow Report</a>
                                <a class="nav-link py-1 small" href="/admin/report/graphical">Graphical Analytics</a>
                            </div>
                        </div>

                        <!-- Settings Group -->
                        <div class="mb-1">
                            <button class="nav-link w-100 text-start d-flex justify-content-between align-items-center" type="button" data-bs-toggle="collapse" data-bs-target="#setCollapse">
                                <span><i class="bi bi-wrench me-2"></i> Settings</span>
                                <i class="bi bi-chevron-down small"></i>
                            </button>
                            <div class="collapse ps-3" id="setCollapse" data-bs-parent="#sidebarMenu">
                                <a class="nav-link py-1 small" href="/admin/settings/system">System Settings</a>
                                <a class="nav-link py-1 small" href="/admin/settings/late_fee">Late Fee Settings</a>
                                <a class="nav-link py-1 small" href="/admin/notice">Noticeboard</a>
                            </div>
                        </div>

                        <hr class="text-secondary">
                        <a class="nav-link text-danger" href="/login/logout">
                            <i class="bi bi-box-arrow-right me-2"></i> Logout
                        </a>
                    </div>
                </div>
            </nav>

            <!-- Main Content -->
            <main class="main-content">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2"><?= esc($title ?? 'Dashboard') ?></h1>
                </div>

                <!-- Flash Messages -->
                <?php if (session()->getFlashdata('success')): ?>
                    <div class="alert alert-success"><?= session()->getFlashdata('success') ?></div>
                <?php endif; ?>

                <?php if (session()->getFlashdata('error')): ?>
                    <div class="alert alert-danger"><?= session()->getFlashdata('error') ?></div>
                <?php endif; ?>

                <!-- Dynamic Content -->
                <?= $this->renderSection('content') ?>

            </main>
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
