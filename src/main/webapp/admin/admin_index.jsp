<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Admin" %>
<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("admin_login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Gamuda.LK Dashboard</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap and Font Awesome -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
  <!-- Lucide Icons -->
  <script src="https://unpkg.com/lucide@latest/dist/umd/lucide.min.js"></script>
<style>
  body {
    font-family: 'Segoe UI', sans-serif;
  }

  .sidebar {
    background-color: #f9fafb;
    width: 250px;
    min-height: 100vh;
    transition: width 0.3s;
    flex-direction: column;
  	position: relative; /* 🧲 Make sidebar a positioning context */
  }
	.logout-wrapper {
	  margin-top: auto;
	  padding: 10px 20px;
	}

  .sidebar.collapsed {
    width: 70px;
  }
  .sidebar.collapsed .logout-wrapper {
  padding: 10px 0;
  display: flex;
  justify-content: center;
}

  .sidebar .nav-link {
    color: #333;
    display: flex;
    align-items: center;
    gap: 10px;
    padding: 10px 20px;
  }a

  .sidebar.collapsed .nav-link span {
    display: none;
  }

  .sidebar.collapsed .logo-full {
    display: none;
  }

  .sidebar.collapsed .logo-icon {
    display: inline;
  }

  .logo-icon {
    display: none;
  }

  .main-content {
    flex-grow: 1;
    padding: 20px;
    overflow-y: auto;
  }

  .top-nav {
    background-color: #fff;
    padding: 10px 20px;
    border-bottom: 1px solid #ddd;
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  .btn-toggle-sidebar {
    background: none;
    border: none;
    font-size: 20px;
    margin-right: 10px;
    
    
  }

  @media (max-width: 768px) {
    .sidebar {
      position: fixed;
      left: -250px;
      top: 0;
      height: 100%;
      z-index: 1000;
    }

    .sidebar.show {
      left: 0;
    }

    .overlay {
      display: none;
      position: fixed;
      top: 0; left: 0;
      width: 100%; height: 100%;
      background: rgba(0,0,0,0.3);
      z-index: 999;
    }

    .overlay.show {
      display: block;
    }
  }

  /* 🔽 NEW CSS FOR COLLAPSED SIDEBAR 🔽 */

  .sidebar.collapsed .nav-top,
  .sidebar.collapsed .nav-middle {
    display: none;
  }

  .sidebar.collapsed .logout-wrapper {
    margin-top: auto;
    display: flex;
    justify-content: center;
    padding: 10px 0;
	  }
	
	.sidebar.collapsed .logout-wrapper span {
	    display: none;
	  }
	
	.logout-wrapper {
	    padding: 10px 20px;
	 }
	
	 .logout-wrapper button {
	    width: 100%;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    gap: 10px;
	  }
	.sidebar.collapsed .logout-wrapper button span {
		  display: none;
		}
		
	.sidebar.collapsed .logout-wrapper {
		  padding: 10px 0;
		  display: flex;
		  justify-content: center;
	}
  
</style>

<body>

<!-- Sidebar -->
<div class="d-flex">
  <div id="sidebar" class="sidebar d-flex flex-column">
    <div class="p-3">
      <h4 class="logo-full">Gamuda.LK</h4>
      <h4 class="logo-icon">G.</h4>
    </div>
	<nav class="nav flex-column">
	  <a href="dashboard.jsp" class="nav-link" target="contentFrame"><i data-lucide="gauge"></i><span>Dashboard</span></a>
	  <a href="http://localhost:8083/online-e-shopping-store/admin/ManagerAdmin/ManagerHome.jsp" class="nav-link" target="contentFrame"><i data-lucide="shopping-cart"></i><span>Orders</span></a>
	  <a href="products.jsp" class="nav-link" target="contentFrame"><i data-lucide="box"></i><span>Products</span></a>
	  <a href="customers.jsp" class="nav-link" target="contentFrame"><i data-lucide="users"></i><span>Customers</span></a>
	  <a href="Manage_all_admins" class="nav-link" target="contentFrame"><i data-lucide="shield-check"></i><span>Admins</span></a>
	  <a href="billing.jsp" class="nav-link" target="contentFrame"><i data-lucide="line-chart"></i><span>Billing</span></a>
	  <a href="settings.jsp" class="nav-link" target="contentFrame"><i data-lucide="settings"></i><span>Settings</span></a>
	  <a href="help.jsp" class="nav-link" target="contentFrame"><i data-lucide="help-circle"></i><span>Help</span></a>
	</nav>
	<div class="logout-wrapper">
	  <form method="GET" action="Admin_logout">
	    <button type="submit" class="btn btn-danger d-flex align-items-center justify-content-center gap-2">
	      <i data-lucide="log-out"></i> <span>Logout</span>
	    </button>
	  </form>
	</div>
  </div>

  <!-- Main Content Area -->
  <div class="flex-grow-1 d-flex flex-column">
    <div class="top-nav">
      <div>
        <button id="toggleBtn" class="btn-toggle-sidebar"><i class="fas fa-bars"></i></button>
		</div>
		<div class="d-flex align-items-center gap-2">
		  <div class="profile-icon rounded-circle overflow-hidden" style="width: 35px; height: 35px;">
		    <img src="Admin_Image?adminId=${admin.adminid}" onerror="this.src='<%=request.getContextPath()%>/admin/Adminassets/images/default.webp';" alt="Profile" style="width: 100%; height: 100%; object-fit: cover;">
		  </div>
		  <span><%= admin.getEmail() %></span>
		</div>

    </div>
    <main class="main-content">
      <iframe src="dashboard.jsp" name="contentFrame" frameborder="0" style="width: 100%; height: 80vh; border: none; border-radius: 8px;"></iframe>
      <div id="loading" style="display: none; text-align: center; padding: 20px;">
        <div class="spinner-border text-primary" role="status">
          <span class="visually-hidden">Loading...</span>
        </div>
      </div>
    </main>
  </div>
</div>

<!-- Overlay for mobile -->
<div id="overlay" class="overlay"></div>
	<script>
		  // Initialize Lucide icons
		  lucide.createIcons();
		
		  const toggleBtn = document.getElementById('toggleBtn');
		  const sidebar = document.getElementById('sidebar');
		  const overlay = document.getElementById('overlay');
		  const iframe = document.querySelector('iframe[name="contentFrame"]');
		  const loading = document.getElementById('loading');
		  const links = document.querySelectorAll('.nav-link');
				
		// Handle sidebar toggle (collapse on large screens, show/hide on mobile)
		toggleBtn.addEventListener('click', () => {
					if (window.innerWidth <= 768) {
					    sidebar.classList.toggle('show');
					    overlay.classList.toggle('show');
					 } else {
					    sidebar.classList.toggle('collapsed');
					    lucide.createIcons();
					  }
			});


		
		  // Close mobile sidebar when overlay is clicked
		  overlay.addEventListener('click', () => {
		    sidebar.classList.remove('show');
		    overlay.classList.remove('show');
		  });
		
		  // Show loading spinner when iframe starts loading
		  iframe.addEventListener('load', () => {
		    loading.style.display = 'none';
		  });
		
		  // Add click behavior to all sidebar links
		  links.forEach(link => {
		    link.addEventListener('click', function () {
		      loading.style.display = 'block';
		
		      // Highlight active tab
		      links.forEach(l => l.classList.remove('active'));
		      this.classList.add('active');
		
		      // Hide sidebar on mobile after click
		      if (window.innerWidth <= 768) {
		        sidebar.classList.remove('show');
		        overlay.classList.remove('show');
		      }
		
		      // No need to set iframe.src manually because of target="contentFrame"
		    });
		  });
	</script>

</body>
</html>
