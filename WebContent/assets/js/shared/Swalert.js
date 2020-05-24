/**
 * 
 */

(function ($) {
    show = function (type , member_id) {
    	alert(member_id);
        'use strict';
        
        
     if (type === 'deprive') {
        Swal.fire({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#2196f3',
            cancelButtonColor: '#ff6258',
            confirmButtonText: '확인',
            cancelButtonText: '취소',
            customClass: {
                confirmButton: 'btn btn-primary',
                cancelButton: 'btn btn-danger'
            }

        }).then((result) => {
        	
            if (result.value) {
                Swal.fire({
                    title: 'Deleted!',
                    text: 'Your file has been deleted.',
                    icon: 'success',
                    confirmButtonColor: '#2196f3',
                    confirmButtonText: '확인',
                    customClass: {
                        confirmButton: 'btn btn-primary'
                        }
                    })
                }
            })

        } 
    }

})(jQuery);
$.fn.modal.Constructor.prototype._enforceFocus = function() {};
        
