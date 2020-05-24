<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
                <footer class="footer">
                  <div class="container-fluid clearfix">
                    <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright Â© 2019 <a href="http://www.bootstrapdash.com/" target="_blank">Bootstrapdash</a>. All rights reserved.</span>
                    <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted & made with <i class="mdi mdi-heart text-danger"></i>
                    </span>
                  </div>
                </footer>

            </div>
            <!-- main-panel ends -->
        </div>
        <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="../../assets/vendors/js/vendor.bundle.base.js"></script>
    <script src="../../assets/vendors/js/vendor.bundle.addons.js"></script>
    <script src="../../assets/vendors/datatables.net/jquery.dataTables.js"></script>
    <script src="../../assets/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
    <script src="../../assets/vendors/datatables.net-fixedcolumns-bs4/dataTables.fixedColumns.min.js"></script>
    <script src="../../assets/vendors/lightgallery/js/lightgallery-all.min.js"></script>
    <script src="../../assets/vendors/jquery-validation/jquery.validate.min.js"></script>
    <script src="../../assets/vendors/bootstrap-maxlength/bootstrap-maxlength.min.js"></script>
    <script src="../../assets/vendors/dropify/dropify.min.js"></script>
    <script src="../../assets/vendors/inputmask/jquery.inputmask.bundle.js"></script>
    <script src="../../assets/vendors/jquery-validation/jquery.validate.min.js"></script>
	<script src="../../assets/vendors/bootstrap-maxlength/bootstrap-maxlength.min.js"></script>
	<script src="../../assets/vendors/dropify/dropify.min.js"></script>
    
    
    <script src="https://cdn.datatables.net/buttons/1.6.1/js/dataTables.buttons.min.js"></script>
	<script src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.flash.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
	<script src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.html5.min.js"></script>
	<script src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.print.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.10.12/dist/sweetalert2.all.min.js"></script>
	
    <!-- Custom js for page -->
    <script src="../../assets/js/shared/form-validation.js"></script>
    <script src="../../assets/js/shared/bt-maxLength.js"></script>
    <script src="../../assets/js/shared/dropify.js"></script>
    <script src="../../assets/js/shared/inputmask.js"></script>
    <script src="../../assets/js/shared/data-table.js"></script>
    <script src="../../assets/js/shared/light-gallery.js"></script>
 	<!-- End Custom js for page -->
 	
    <!-- inject:js -->
    <script src="../../assets/js/shared/off-canvas.js"></script>
    <script src="../../assets/js/shared/misc.js"></script>
    <script src="../../assets/js/shared/alert.js"></script>
    <script src="../../assets/js/shared/Swalert.js"></script>
    
    <!-- endinject -->
    
    <!-- Custom js for this page-->
    <script src="../../assets/js/demo_1/dashboard.js"></script>
    <!-- End custom js for this page-->
    
    <script src="../../js/admin.js"></script>
    <script src="../../assets/js/admin/hotel.js"></script>
    
    <!-- 다음 우편번호 서비스 관련 js -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	// 다음 우편번호 서비스
    function openDaumZipAddress() {
        new daum.Postcode({
            oncomplete: function (data) {
                jQuery("#postcode1").val(data.postcode1);
                jQuery("#postcode2").val(data.postcode2);
                jQuery("#zonecode").val(data.zonecode);
                jQuery("#place_location").val(data.address);
                jQuery("#address2").focus();
                console.log(data);
            }
        }).open();
    }
	
    function openDaumZipAddress2() {
        new daum.Postcode({
            oncomplete: function (data) {
                jQuery("#place_location").val(data.address);
                console.log(data);
            }
        }).open();
    }
	
	ptn.func();
	</script>
</body>

</html>