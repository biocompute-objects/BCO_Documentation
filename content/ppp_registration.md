---
title: "Consortium Registration"
menu: "main"
---

<div class="col-lg-6 offset-lg-3 text-center">
<img src="/images/logo.about.png" class="img-fluid mx-auto d-block" width="75%" alt="">
</div>

<br>

### Please enter your e-mail below to join the BioCompute Public Private Partnership.

<form id="reg_form" name="contact">

<p>
<label>Your Email:</label><input type="email" name="email" id="inputemail" class="form-control">
</p>

<p>
<label>Your Institution:</label><input name="institution" id="inputinstitution" class="form-control">
</p>

<p>
<button type="submit" class="btn btn-primary">Register</button>
</p>

</form>
<script>
const handleSubmit = (e) => {
	e.preventDefault();
	let myForm = document.getElementById("reg_form");
	let formData = new FormData(myForm);
	fetch('https://biocomputeobject.org/register/', {
		method: 'POST',
		headers: { 'Content-type': 'application/x-www-form-urlencoded' },
		body: new URLSearchParams(formData).toString()
}).then(() => {
	alert('Thank your for signing up for the BioCompute Consortium!  Close this alert to return to the homepage.');
	window.location.href='https://www.biocomputeobject.org';});
};
document.querySelector("form").addEventListener("submit", handleSubmit);
</script>
