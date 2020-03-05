<ul class="nav">
    <li <?php if ($p == "home.php") { ?> class="active" <?php } ?>>
        <a href="index.php">
            <i class="pe-7s-graph"></i>
            <p>Dashboard</p>
        </a>
    </li>
    <li <?php if ($p == "users.php" or $p == "addedituser.php") { ?> class="active" <?php } ?>>
        <a href="index.php?p=users">
            <i class="pe-7s-users"></i>
            <p>Manage Users </p>
        </a>
    </li>
    <li <?php if ($p == "categories.php" or $p == "addeditcategory.php") { ?> class="active" <?php } ?>>
        <a href="index.php?p=categories">
            <i class="pe-7s-cart"></i>
            <p>Manage Categories </p>
        </a>
    </li>
    <li <?php if ($p == "products.php" or $p == "addeditproduct.php") { ?> class="active" <?php } ?>>
        <a href="index.php?p=products">
            <i class="pe-7s-cart"></i>
            <p>Manage Products </p>
        </a>
    </li>
    <li <?php if ($p == "faqs.php" or $p == "addeditfaq.php") { ?> class="active" <?php } ?>>
        <a href="index.php?p=faqs">
            <i class="pe-7s-help1"></i>
            <p>Manage FAQs </p>
        </a>
    </li>
    <li <?php if ($p == "cms.php" or $p == "addeditcms.php") { ?> class="active" <?php } ?>>
        <a href="index.php?p=cms">
            <i class="pe-7s-note"></i>
            <p>Manage CMS </p>
        </a>
    </li> 
    <li <?php if ($p == "news.php" or $p == "addeditnews.php") { ?> class="active" <?php } ?>>
        <a href="index.php?p=news">
            <i class="pe-7s-note"></i>
            <p>Manage News </p>
        </a>
    </li>
    <li <?php if ($p == "emails.php" or $p == "addeditemail.php") { ?> class="active" <?php } ?>>
        <a href="index.php?p=emails">
            <i class="pe-7s-mail"></i>
            <p>Manage Emails</p>
        </a>
    </li>
    <li <?php if ($p == "setting.php") { ?> class="active" <?php } ?>>
        <a href="index.php?p=setting">
            <i class="fa fa-cog" style="color:#fff;"></i>
            <p>Manage Settings</p>
        </a>
    </li>
    <li <?php if ($p == "packages.php") { ?> class="active" <?php } ?>>
        <a href="index.php?p=packages">
            <i class="pe-7s-users" style="color:#fff;"></i>
            <p>Manage packages</p>
        </a>
    </li>
</ul>