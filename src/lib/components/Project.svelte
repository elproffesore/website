<script>
	import { onMount } from "svelte";
    import { marked } from 'marked';
    let {projectName}  = $props();

    let project = $state("")
    let type = $state("")
    let date = $state("")
    let description = $state("")
    let technologies = $state("")
    let collaborators = $state("")
    let documentation = $state("")
    let demo = $state("")
    let documentationOpen = $state(false)

    onMount(async () => {
        let response = await fetch(`/media/${projectName}/text.md`)
        let content = await response.text();
        let parts = content.split('---').map(item => item.trim());
        project = parts[0];
        type = parts[1];
        date = parts[2];
        description = marked.parse(parts[3]);
        technologies = JSON.parse(parts[4]);
        collaborators = JSON.parse(parts[5]);
        documentation = parts[6]
        demo = JSON.parse(parts[7])
    })
</script>

<div class="flex flex-col gap-4">
	<div class="grid grid-cols-3">
		<div class="col-start-1 col-span-3 row-start-1">
			<h1>{project}</h1>
			<h2>{type}</h2>
		</div>
		<div class="col-start-3 col-span-1 row-start-1 self-end text-right">
			<h3>{date}</h3>
		</div>
	</div>
	<div class="grid grid-cols-6 gap-4 p-4 bg-card-background border border-card-border">
		<div class="col-span-4">
			<h3>Context</h3>
			<p class="mt-2">
				{@html description}
			</p>
		</div>
        <div class="col-span-2 flex flex-col gap-4">
			<div>
				<h3>Technology Stack</h3>
				<div class="flex flex-wrap gap-2 mt-2">
					{#each technologies as tech}
						<div class="flex gap-2 px-2 py-1 border rounded-full items-center">
							<img src="icons/{tech.icon}.svg" alt={tech.name} class="w-4 h-4" loading="lazy" />
							<p class="">{tech.name}</p>
						</div>
					{/each}
				</div>
			</div>
			<div >
				<h3>Collaborators</h3>
				<div class="flex gap-2 mt-2">
					{#each collaborators as collaborator}
						<div class="flex gap-2 items-center">
							<img
								src={`/collaborators/${collaborator.name.toLowerCase().replaceAll(' ', '-')}.webp`}
								alt={collaborator.name}
								class="w-6 h-6 rounded-full object-cover"
								loading="lazy"
							/>
							<p class="">{collaborator.name}</p>
						</div>
					{/each}
				</div>
			</div>
            <div class="flex flex-col gap-2">
                <h3>Links</h3>
                {#each demo as link}
                    <p class="w-max border border-border px-4 py-1 rounded-full hover:bg-accent hover:text-black transition">
                        <a href={link.url} class="text-black no-underline" target="_blank" rel="noopener noreferrer">{link.name}</a>
                    </p>
                {/each}
            </div>
		</div>
	</div>
	<div class="flex flex-col gap-2 p-4 bg-card-background border border-card-border">
		<div class="grid grid-cols-2 w-full">
			<h3>Documentation</h3>
			<button
				class="text-sm text-gray justify-self-end"
				onclick={() => (documentationOpen = !documentationOpen)}
				>{documentationOpen ? 'Close' : 'Open'}
			</button>
		</div>
		<div class="h-0  overflow-hidden" class:-mt-2={!documentationOpen} class:h-full={documentationOpen}>
			{@html documentation}
		</div>
	</div>
</div>
