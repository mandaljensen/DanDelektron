permissionset 50000 DDPermission
{
    Assignable = true;
    Permissions = tabledata "Job Cost And Price" = RIMD,
        table "Job Cost And Price" = X,
        report "DD Job Quote" = X,
        report "DD Purchase Order" = X,
        report "DD Sales Credit Memo" = X,
        report "DD Sales Invoice" = X,
        report "DD Sales Order" = X,
        report "DD Work Order" = X,
        report "DDItem Ledger - Negative Stock" = X,
        report "Item Label" = X,
        codeunit "Dan Delektron Subscribers" = X;
}